#!/bin/bash

# Create a single output file
OUTPUT_FILE="system_benchmark_$(hostname)_$(date +%Y%m%d_%H%M%S).txt"

# Function to run a command and append output to the file
run_cmd() {
  echo -e "\n\n===== $2 =====" >>"$OUTPUT_FILE"
  echo "Command: $1" >>"$OUTPUT_FILE"
  eval $1 >>"$OUTPUT_FILE" 2>&1
  echo -e "\n" >>"$OUTPUT_FILE"
}

echo "Gathering system performance data. This may take several minutes..."
echo "Results will be saved to $OUTPUT_FILE"

# Start with a header
echo "===== SYSTEM BENCHMARK RESULTS =====" >"$OUTPUT_FILE"
echo "Date: $(date)" >>"$OUTPUT_FILE"

# System information
run_cmd "hostname" "HOSTNAME"
run_cmd "uname -a" "KERNEL VERSION"
run_cmd "cat /etc/os-release" "OS RELEASE"
run_cmd "uptime" "UPTIME"

# CPU information
run_cmd "lscpu" "CPU INFO"
run_cmd "cat /proc/cpuinfo" "CPU INFO (DETAILED)"
run_cmd "nproc" "CPU CORES"

# Memory information
run_cmd "free -h" "MEMORY USAGE"
run_cmd "cat /proc/meminfo" "MEMORY INFO (DETAILED)"

# Disk information
run_cmd "lsblk" "DISK LIST"
run_cmd "df -h" "DISK USAGE"
run_cmd "mount" "MOUNT POINTS"

# Network information
run_cmd "ip addr" "NETWORK INTERFACES"
run_cmd "ip route" "NETWORK ROUTES"
run_cmd "netstat -tuln" "OPEN PORTS"

# Load averages
run_cmd "vmstat 1 5" "VMSTAT (5 SECONDS)"

# Install required tools if not present (if root)
if [ $(id -u) -eq 0 ]; then
  if command -v pacman >/dev/null; then
    # For Arch Linux
    if ! command -v sysbench >/dev/null; then
      echo "Installing sysbench for benchmarks..."
      pacman -Sy --noconfirm sysbench
    fi
    if ! command -v hdparm >/dev/null; then
      echo "Installing hdparm for disk tests..."
      pacman -Sy --noconfirm hdparm
    fi
  fi
fi

# Quick benchmarks (if available)
if command -v sysbench >/dev/null; then
  echo "Running CPU benchmark (this will take about 10 seconds)..."
  run_cmd "sysbench --test=cpu --cpu-max-prime=20000 run" "CPU BENCHMARK"

  echo "Running memory benchmark (this will take about 10 seconds)..."
  run_cmd "sysbench --test=memory --memory-total-size=1G run" "MEMORY BENCHMARK"

  echo "Running file I/O benchmark (this will take about 30 seconds)..."
  run_cmd "sysbench --test=fileio --file-test-mode=seqwr --file-total-size=1G prepare" "FILEIO PREPARE"
  run_cmd "sysbench --test=fileio --file-test-mode=seqwr --file-total-size=1G run" "FILEIO SEQUENTIAL WRITE"
  run_cmd "sysbench --test=fileio --file-test-mode=seqrd --file-total-size=1G run" "FILEIO SEQUENTIAL READ"
  run_cmd "sysbench --test=fileio --file-test-mode=rndrd --file-total-size=1G run" "FILEIO RANDOM READ"
  run_cmd "sysbench --test=fileio --file-test-mode=rndwr --file-total-size=1G run" "FILEIO RANDOM WRITE"
  run_cmd "sysbench --test=fileio --file-test-mode=rndrw --file-total-size=1G run" "FILEIO RANDOM READ/WRITE"
  run_cmd "sysbench --test=fileio --file-test-mode=seqwr --file-total-size=1G cleanup" "FILEIO CLEANUP"
else
  echo "Sysbench not installed. Skipping sysbench benchmarks." >>"$OUTPUT_FILE"
  echo "To install sysbench on Arch Linux: sudo pacman -S sysbench" >>"$OUTPUT_FILE"
fi

# Basic disk speed test
echo "Running basic disk speed test..."
run_cmd "dd if=/dev/zero of=/tmp/test_file bs=1M count=1024 conv=fdatasync" "DISK WRITE SPEED"
run_cmd "dd if=/tmp/test_file of=/dev/null bs=1M count=1024" "DISK READ SPEED"
rm -f "/tmp/test_file"

# Hardware information
if command -v lshw >/dev/null; then
  run_cmd "lshw -short" "HARDWARE SUMMARY"
elif command -v lspci >/dev/null; then
  run_cmd "lspci" "PCI DEVICES"
fi

# If hdparm is available, test disk performance
if command -v hdparm >/dev/null; then
  for disk in $(lsblk -d -o NAME | grep -v NAME); do
    if [[ $disk == nvme* ]] || [[ $disk == sd* ]]; then
      run_cmd "sudo hdparm -t /dev/$disk" "DISK READ SPEED (/dev/$disk)"
    fi
  done
fi

# Summary
echo -e "\n\n===== BENCHMARK COMPLETE =====" >>"$OUTPUT_FILE"
echo "Results saved to $OUTPUT_FILE"
echo "To compare systems, run this script on both machines and compare the output files."

# Display file location
echo ""
echo "Benchmark complete! Results saved to:"
echo "$PWD/$OUTPUT_FILE"
