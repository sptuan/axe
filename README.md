# axe
Personal useful tool for dev.

## tools
### fake_file
#### fake_file_gen.sh
Generate fake files for mock. Using
```commandline
dd if=/dev/urandom of=randomfile01.bin bs=10M count=1000
```

```commandline
script usage:  -nfbcr
      -f    filename_prefix
      -n    file num
      -b    blocksize
      -c    blockcount
      -r    random_blockcount_range
      -s    file_suffix
            
      final_blockcount : blockcount +- random_blockcount_range/2
      
      example ./fake_file_gen.sh -f file -n 100 -b 1k -c 100 -r 10 -s .mp4

```

result
```
➜  ./fake_file_gen.sh -f file -n 100 -b 1k -c 100 -r 10 -s .mp4

➜  ls -l                                                       
total 20448
-rwxrwxrwx  1 levi.zhou  staff    1522 Jan 17 18:24 fake_file_gen.sh
-rw-r--r--  1 levi.zhou  staff  102400 Jan 17 18:34 file-0-29249.mp4
-rw-r--r--  1 levi.zhou  staff   98304 Jan 17 18:34 file-1-16031.mp4
-rw-r--r--  1 levi.zhou  staff  104448 Jan 17 18:34 file-10-13371.mp4
-rw-r--r--  1 levi.zhou  staff  107520 Jan 17 18:34 file-11-27211.mp4
-rw-r--r--  1 levi.zhou  staff  103424 Jan 17 18:34 file-12-10860.mp4
......
```