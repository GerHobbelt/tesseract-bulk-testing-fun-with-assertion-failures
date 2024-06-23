
# Wicked timeouts (3 minutes for any single `tesseract` invocation) do happen during the batch test

As I mentioned elsewhere in my notes, there is a chance we MAY see the built-in timeouts kicking in. 
This is based on earlier observations while I was designing this batch test and its scripts, where under spurious conditions some `tesseract.exe` runs seemed to lock up forever (minutes...) and had to be hard terminated using the MS Windows task manager (or Process Hacker inspector, in my case), which drove me to add those `timeout` statements in the bash test runner scripts.

Now the question became: did we experience a timeout anywhere?
For `timeout` isn't verbal about this (except its 124 exit code, which we don't check) we need to go at it from another angle: all our tesseract runs are wrapped in 

     time timeout tesseract ...yadayada...
	 
so our outer log files will carry relevant timing information: when the "real" time is close to 3 minutes (our chosen timeout setting in the batch test scripts everywhere), then we can be pretty sure something fishy is going on and the timeout kicked in and aborted that particular `tesseract` run.

The bash code to dig that one up:

```sh
$ find -name '*.log' | xargs -n 10 grep -E '^real\s[1-9]'
```

which reports rather a few more, but that's fine with me: the goal of that `grep` regex is to pick up the one that took at least a minute and are already *questionable* from my (performance) perspective; when the time is just below or above the 3 minute mark, then we're talking about aborted runs:

```sh
$ find -name '*.log' | xargs -n 10 grep -E '^real\s[2-9]'
```

should give a decent result with little "very long but successful running" sample noise left.


Here's the preliminary set (the batch test is still running!):

```
$ find -name '*.log' | xargs -n 10 grep -E '^real\s[2-9]'


./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-RSIZE-2700x3572-debug-2.log:real	2m30.438s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.150s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.165s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.202s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.193s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.232s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.227s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.238s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.283s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.244s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x3751-debug-2.log:real	2m28.814s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x3939-debug-2.log:real	2m51.431s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4136-debug-2.log:real	2m52.427s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4343-debug-2.log:real	3m0.144s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4561-debug-2.log:real	3m0.149s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4790-debug-2.log:real	3m0.150s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5030-debug-2.log:real	3m0.129s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5282-debug-2.log:real	3m0.130s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5547-debug-2.log:real	3m0.145s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5825-debug-2.log:real	3m0.131s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	2m45.503s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.153s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.172s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.143s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.191s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.164s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.151s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.157s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.189s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.158s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.163s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x13366-debug-2.log:real	2m29.898s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x14035-debug-2.log:real	2m45.545s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x14737-debug-2.log:real	2m53.597s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x15474-debug-2.log:real	2m41.582s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-RSIZE-2700x3572-debug-2.log:real	2m18.191s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.154s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.156s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.174s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.190s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.258s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.222s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.211s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.236s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.242s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x3751-debug-2.log:real	2m18.064s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x3939-debug-2.log:real	2m39.912s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4136-debug-2.log:real	2m38.492s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4343-debug-2.log:real	3m0.109s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4561-debug-2.log:real	3m0.112s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4790-debug-2.log:real	3m0.133s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5030-debug-2.log:real	3m0.138s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5282-debug-2.log:real	3m0.134s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5547-debug-2.log:real	3m0.133s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5825-debug-2.log:real	3m0.117s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	2m32.801s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.126s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.134s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.123s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.147s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.149s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.143s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.159s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.146s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.150s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.177s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x14035-debug-2.log:real	2m2.718s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x14737-debug-2.log:real	2m7.757s
./B_RUN_data-1001-000-0003-b-leveled/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x15474-debug-2.log:real	2m4.258s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.164s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.260s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.180s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.189s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.231s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.259s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.227s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.252s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.257s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	2m28.934s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.149s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.138s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.171s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.180s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.165s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.138s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.160s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.182s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.177s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.186s
./B_RUN_data-1001-001-0003-b1/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x15474-debug-2.log:real	2m4.698s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.156s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.187s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.181s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.224s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.190s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.205s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.200s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.227s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.292s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	2m17.348s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.119s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.126s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.140s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.158s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.137s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.126s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.139s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.132s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.188s
./B_RUN_data-1001-001-0003-b1/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.205s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-RSIZE-2700x3572-debug-2.log:real	3m0.198s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.193s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.212s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.188s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.203s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.195s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.242s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.223s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.320s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.237s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x3939-debug-2.log:real	3m0.147s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4136-debug-2.log:real	3m0.109s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4343-debug-2.log:real	3m0.132s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4561-debug-2.log:real	3m0.113s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x4790-debug-2.log:real	3m0.121s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5030-debug-2.log:real	3m0.134s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5282-debug-2.log:real	3m0.142s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5547-debug-2.log:real	3m0.148s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x5825-debug-2.log:real	3m0.128s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	3m0.151s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.143s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.145s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.152s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.152s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.174s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.144s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.151s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.178s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.187s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.187s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x12122-debug-2.log:real	2m6.216s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x12729-debug-2.log:real	2m13.328s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x13366-debug-2.log:real	2m22.275s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x14035-debug-2.log:real	3m0.207s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x14737-debug-2.log:real	3m0.292s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_best/OEM3/PSM6-TH1-USIZE-2700x15474-debug-2.log:real	2m53.296s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-RSIZE-2700x3572-debug-2.log:real	2m52.530s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10470-debug-2.log:real	3m0.181s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x10994-debug-2.log:real	3m0.197s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x11544-debug-2.log:real	3m0.189s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12122-debug-2.log:real	3m0.186s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x12729-debug-2.log:real	3m0.191s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x13366-debug-2.log:real	3m0.217s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14035-debug-2.log:real	3m0.199s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x14737-debug-2.log:real	3m0.222s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x15474-debug-2.log:real	3m0.232s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x3939-debug-2.log:real	2m53.523s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4136-debug-2.log:real	2m45.956s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4343-debug-2.log:real	3m0.101s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4561-debug-2.log:real	3m0.118s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x4790-debug-2.log:real	3m0.111s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5030-debug-2.log:real	3m0.133s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5282-debug-2.log:real	3m0.190s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5547-debug-2.log:real	3m0.125s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x5825-debug-2.log:real	3m0.160s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6117-debug-2.log:real	3m0.144s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6423-debug-2.log:real	3m0.155s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x6745-debug-2.log:real	3m0.146s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7083-debug-2.log:real	3m0.118s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7438-debug-2.log:real	3m0.167s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x7810-debug-2.log:real	3m0.128s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8201-debug-2.log:real	3m0.159s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x8612-debug-2.log:real	3m0.138s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9043-debug-2.log:real	3m0.169s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9496-debug-2.log:real	3m0.165s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM11-TH1-USIZE-2700x9971-debug-2.log:real	3m0.155s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x14035-debug-2.log:real	2m9.087s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x14737-debug-2.log:real	2m15.646s
./B_RUN_data-1002-000-0003-b-leveled-s-curve/tessdata_fast/OEM3/PSM6-TH1-USIZE-2700x15474-debug-2.log:real	2m6.555s
