
Thanks to the asserts thrown by tesseract we've fragmented runs:


```sh
$ for t in tessdata tessdata_fast tessdata_best ; do for f in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 ; do \
      echo "$t: PSM$f:" ; \
      ( find B_RUN_data-1001-000-0003-b-leveled/$t/OEM3/ -name "PSM$f*.tif" | wc -l ) ; \
  done ; done
-->
tessdata: PSM0:
0
tessdata: PSM1:
172
tessdata: PSM2:
0
tessdata: PSM3:
83
tessdata: PSM4:
0
tessdata: PSM5:
0
tessdata: PSM6:
56
tessdata: PSM7:
0
tessdata: PSM8:
0
tessdata: PSM9:
0
tessdata: PSM10:
0
tessdata: PSM11:
86
tessdata: PSM12:
0
tessdata: PSM13:
2
tessdata_fast: PSM0:
0
tessdata_fast: PSM1:
626
tessdata_fast: PSM2:
0
tessdata_fast: PSM3:
213
tessdata_fast: PSM4:
0
tessdata_fast: PSM5:
0
tessdata_fast: PSM6:
213
tessdata_fast: PSM7:
0
tessdata_fast: PSM8:
0
tessdata_fast: PSM9:
0
tessdata_fast: PSM10:
0
tessdata_fast: PSM11:
200
tessdata_fast: PSM12:
0
tessdata_fast: PSM13:
213
tessdata_best: PSM0:
0
tessdata_best: PSM1:
622
tessdata_best: PSM2:
0
tessdata_best: PSM3:
213
tessdata_best: PSM4:
0
tessdata_best: PSM5:
0
tessdata_best: PSM6:
213
tessdata_best: PSM7:
0
tessdata_best: PSM8:
0
tessdata_best: PSM9:
0
tessdata_best: PSM10:
0
tessdata_best: PSM11:
196
tessdata_best: PSM12:
0
tessdata_best: PSM13:
213
```



## NOTE: 

This is a sample extracted from the B_RUN. That one only executed all PSM 1,3,6,11,13 tests, none of the others -- which explains the 0 counts for the other PSMs reported here. 

_That's not what this is about_; **check the numbers for PSM 1,3,6,11,13**: **they should all be the same: 213. Any PSM slot not reporting that number for its `wc -l` count has assertion failures**
<sub>-- or possibly other fatalities, such as 3 minutes timeout aborts, but I haven't observed those yet during my sampled investigation of the test output data. Just so ye know there's another 0.1% culprit hiding in a corner somewhere -- we may uncover one such occurrence later, but this here is all about tesseract assertion failures galore when you turn on certain debug features (and thus have some tesseract analysis code traverse the same objects as the mainline); the assert fatality is indicative of a deeper bug lurking IMO</sub>.



## NOTE: 

the github repo now also carries a few choice samples for reviewers to inspect, without the need to run the heavy batch test scripts!

> commit SHA-1: aadc0ede8daafec7b9da9b88946c50ca10f9a117 : including several GOOD + BAD examples of the assertion failure for immediate review when someone else will try to reproduce this; as the batch scripts generate element command shell scripts these indicidual samples come each with their own little shell script which was used to produce them, so that should ease reproduction.



