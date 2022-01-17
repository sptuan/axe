#!/usr/bin/env bash


# get arg
while getopts 'n:f:b:c:r:s:' OPTION; do
  case "$OPTION" in
    f)
      filename_prefix="$OPTARG"
      echo "-file_prefix: $OPTARG"
      ;;

    n)
      nums="$OPTARG"
      echo "-file num: $OPTARG"
      ;;

    b)
      blocksize="$OPTARG"
      echo "-blocksize $OPTARG"
      ;;

    c)
      blockcount="$OPTARG"
      echo "-blockcount $OPTARG"
      ;;

    r)
      random_range="$OPTARG"
      echo "-random_blockcount_range +- $OPTARG"
      ;;

    s)
      suffix="$OPTARG"
      echo "-file_suffix: $OPTARG"
      ;;

    ?)
      echo "script usage: $ -nfbcr"
      echo "-f    filename_prefix"
      echo "-n    file num"
      echo "-b    blocksize"
      echo "-c    blockcount"
      echo "-r    random_blockcount_range"
      echo "-s    file_suffix"
      echo "      final_blockcount : blockcount +- random_blockcount_range/2"
      echo "example ./fake_file_gen.sh -f file -n 100 -b 1m -c 0 -r 10 -s .mp4"
      exit 1
      ;;
  esac
done

# gen files
counter=0
while [ "$counter" -lt "$nums" ]; do

  echo "[INFO] genfiles: dd if=/dev/urandom of=${filename_prefix}-${counter}-$RANDOM${suffix} bs=${blocksize} \
  count=$(($blockcount + $RANDOM % $random_range + 1 - $random_range /2))"

#  echo $(($blockcount + $RANDOM % $random_range + 1 - $random_range /2))

  dd if=/dev/urandom of="${filename_prefix}-${counter}-$RANDOM${suffix}" bs=${blocksize} \
  count=$(($blockcount + $RANDOM % $random_range + 1 - $random_range /2))

  counter=$((counter + 1))
done

