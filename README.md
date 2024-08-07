# tesseract: bulk testing fun (with assertion failures)

Original goal: analyze the impact of various image preprocessing actions on OCR results/quality, while also considering the image size (simile for the text line height in pixels metric), PSM, OEM and other major tesseract parameters.

This is a set of bulk tesseract test scripts which take several input images and run every selected input image against tesseract in multiple image sizes and parameter settings; we gather data about tesseract performance and quality.

Along the way we've observed some funny stuff, including (aparently?) input size dependent assert failures.


> [!CAUTION]
> ## Note about `git` repositories
> 
> This corpus is tracked through *two* different repositories (inspired by [multigit](https://github.com/capr/multigit) 🥳):
> 
> - the corpus content (i.e. the **sources**) are tracked in [tesseract-bulk-testing-fun-with-assertion-failures](https://github.com/GerHobbelt/tesseract-bulk-testing-fun-with-assertion-failures)
> - \[examples of\] the corpus output/results (i.e. the HTML/diagnostics and *rendered* lab notes) is tracked in [tesseract-bulk-testing-fun-with-assertion-failures-**outputs**](https://github.com/GerHobbelt/tesseract-bulk-testing-fun-with-assertion-failures-outputs)
>   - this stuff should also be visible at https://gerhobbelt.github.io/tesseract-bulk-testing-fun-with-assertion-failures-outputs/
>



## Prerequisites

- preferrably MS Windows 10 / 11
- [git-for-windows](https://git-scm.com/download/win) or another `bash` provider: you'll need `bash` as we do this using `bash` shell scripts.
  > I'm running Windows, doing Linux-y stuff, but don't run this regularly on Linux boxes, so on actual Linux hardware you may need to edit a few lines pointing to the binaries used.
- ImageMagick v7 installed: the `magick` command must be in your PATH.
- A recent `ffmpeg` for extras, such as producing animation movies of some of the observed aspects.
- [UB Mannheim's official `tesseract`](https://github.com/UB-Mannheim/tesseract/wiki), installed.
  > *All releases are found [here](https://digi.bib.uni-mannheim.de/tesseract/). 
  > 
  > Wider info at [University of Illinois:Library](https://guides.library.illinois.edu/c.php?g=347520&p=4121425#s-lg-box-12819900).*

  See the scripts: we expect that one to exist in `C:/Program Files/`
- a recent NodeJS install for we use Node/JavaScript for the more complicated parts of the test scripts.

  TIP: when you haven't already, find [**`nvm` for Windows**](https://github.com/coreybutler/nvm-windows) and take it from there: that way you easily switch and activate NodeJS versions. Not required for this, but if you do more JS dev work, that's the way to go.
- `grep`, `sed`, `find` and all such UNIX-y goodness. Comes with any git-for-windows full install, so you should be good if you have `git` for Windows installed.


## Executing the bulk run / test

To run the tesseract bulk test:

```sh
cd sizes/
for f in 1* ; do ./run_tess_B-round.sh $f ; done ;       for f in 1021* 1022* 1030* 1038* ; do ./run_tess_round.sh $f ; done
```

To produce an animation/movie of the generated threshold images which were produced by tesseract during bulk run as a side effect (debug settings in the tesseract config file) so one can observe one of the somewhat ~~crazy~~, ähhh, *surprising* behaviours of tesseract internals: the preprocessing code which 'filters' out lines and other image cruft that can easily thwart and throw an OCR core engine off course. This was teaching me new lessons in tesseract behaviour and why it is a **very bad idea to treat any OCR engine as a plug-and-play grade application**: clearly this weaponry is rather quirky! 😄



## Friendly Warning: never enough cores, never enough RAM, never enough disk space :wink:

(I'm running this on a lonely 16 core AMD Ryzen, 128MB RAM, 2x1TB NVMe SSD. Finally, the silent fans are kicking in and noise dB levels climb to 'slight breeze' levels... :clown:)

When you read/inspect the test scripts mentioned above, you'll quicky note that this is not for the 'done by yesterday' crowd: while I was polishing these scripts a little calculus on the napkin produced:
- about 77 different sizes for each input image, as I want to see what happens when we feed tesseract different '*line heights*', i.e. pixels per line. This is very similar to what had to be done to produce the previous research published in the tesseract mailing list and referenced at the tesseract wiki/documentation site.
- I wanted to see what the various OEM and PSM modes would do and it was about time to span the full gamut instead of my previous sampling runs during the past few years: I've seen enough crazy shit that it's time for *full coverage*:
- 16 PSM modes
- 4 OEM modes (yes, I know one of them is alegedly a default that rolls back to one of the other three; I don't care *plus* I have my own tesseract research codebase to consider as well, so I'm not assuming anything any more: we will run all 4 modes through the wringer.
- 3 threshold algorithms / modes currently on offer in tesseract and more to come as my previous experience is that these are a major success/failure factor (combined with the PSM-based image segmentation logic built into tesseract). 

  My major pet peeve why it's currently far smarter/better to do your own image preprocessing, but then there's always these in the way anyway, so even when you do your own preproc, there's enough WTF to go around.
- output to **at least** HOCR, TSV and TXT: TXT gives you the plain OCR text output for an easy gander to see if there's anything *legible* coming out of that box; previous experience has taught me the hard way that character-level info in TSV and HOCR is *quite different* in vanilla tesseract; that's one of the things I attacked in my own research copy as reporting character rankings as `-1` in that one, while printing 70-99% ratings in the other, made me go 🤔🤔🤔 rather fast.

  > Dropped PDF output for now as there's enough to bother about without it; as far as I'm concerned the built-in PDF output mode is a stop-gap / proof-of-concept hack at the moment anyway, definitely *not the way to produce PDF/A* compliant OCR'ed, FTS searchable books, say. The PDF output was taking up enough space during the initial bulk test run script development that I decided to drop PDF output from the current tesseract output set.

Taking these numbers, we can answer this question:


### How many `tesseract` runs per test image will we do? *1.2 million, you say?!* How long does *that* take?!?!

Number of `tesseract` invocations (what I call a 'run'). That would be about $16 \times 4 \times 3 \times 77 \approx 14700$ runs per image.

We currently have about 80 images in this here test set right here, so that would make a grand total of $14700 \times 80 \approx 1.2 \text{million}$ `tesseract` runs.

Let's say they consume 2 seconds each (they don't, but it serves as a *very rough* ball park estimate for now), then this will cost us $\approx 27.4$ CPU hours; add a wet finger estimate of the imagemagick plus `bash` scripting overhead (say 30%) and, given the rather *un*-sophisticated multi-core scheduler (background task running) we do in our scripts, the less than optimal CPU core utilization (average 30% maybe??), a run was estimated to take somewhere around 6 wall clock hours.

**Reality is rather more stubborn** and is currently at 24H+, so surely I've botched some of the numbers in there rather optimistically. 

Of course, the scripts saw a lot of revision during these weeks, so plenty of restarts and with every restart came a **full wipe** as part of the fiddling was getting a decently loud debug log output, while not crazily so -- which turned out to be a *very thin threshold* to balance (note the `tail 8000`-based log file clipping 'panic code' that's part of the bulk run script: that one got in there because *some* files+modes were all too eager to produce up to 700MByte logfiles when you turn everything on: not a problem, not a complaint, but twiddling the right knobs to get this number down to a decent size/count, while still producing sufficient debug log detail enabling me to bulk-analyze tesseract activity details, was a bit of a challenge. Exuses, excuses. Meanwhile the data gathering is plodding on and we already have a few "**odd**" observations.

So I fiddled with the scripts some more, added a bit of a 'restartable' behaviour to them and wiped some surprising results: the goal there being I wanted to answer the question: "**are those assertions and consequent non-results *flukes* or ...**": *nope*, after wiping a couple, the *restarted* scripts produced exactly the same failures to complete these particular `tesseract` invocations -- after inspecting the log files, it's still *reasons unknown*. The latest test scripts now produce their `tesseract` commands in re-runnable form to help with debugging these buggers as I guess that's what it comes down to, once more. *C'est la vie!*


  
## Observations

- tesseract has a rather haphazard habit to abort on an assertion failure: [see the lab notes](./docs/B_RUN_data-1001-000-0003-b-leveled---something-wicked.md) and check that directory to see some GOOD and BAD entries' outputs from the large batch B_RUN test run; the quick rule of thumb there is: when it's got a TIF file (threshold image) it's GOOD, otherwise BAD. BAD as in: application aborted *bad*.

- initial sampling inspection leads me to the guess that tesseract is rather finicky about the text line height: I interpreted previous research as "*tesseract slowly deteriorates in quality as image rez increases beyond the optimum*" but it seems that at larger scale factors the machine gets lost utterly, which is an observation *beyond* previous published research.
  - corrolary to this guestimate: it sure doesn't help that one of the threshold algos' exhibits "*fading out*" style behaviour for these larger scales, as if the text gets 'interpreted' as background fluctuations, rather than *foreground*. This suggests another round of investigation of these algos as I was unable to make this observation before -- only due to this new designed large span batch test does this pattern become aparent.

- some `tesseract` runs consume more than 3 *minutes* apiece! Okay, so this is a (variably) loaded machine, where I sometimes run other heavy loads temporarily (a bit of compiling; the movie-making script under-development also took its sweet time), but generally I'd expect less of these hangups than [I now happen to observe from the logfile `grep` output](./docs/wicked-timeouts-happening.md).

  > Post Scriptum re this phenomenon: profiling a  small sample of the affected runs shows we have two major time guzzlers:
  >
  > 1. tesseract goes completely ape when faced with noisy page binarizations (the monochrome "thresholded" intermediate image result) and spends *ages* recursing through the perceived-as-potentially-text-containing-line-bounding-boxes while trying to discover the best OCR result by splitting these boxes at every potential character boundary, of which we have a bazillion thanks to the loud pixel noise. This is done recursively and after a week of dedicated tests the preliminary statistic for this says (very) noisy images can reach recursion depths of 70-90 and sometimes beyond. Given the amount of effort spent at each recursion depth to OCR  the *potential* characters/words, this obviously takes many minutes, even on fast modern hardware.
  >
  > You may be interested in issue Wxxx if this is a concern if yours as well.
  >
  > 2. producing the diagnostics debug HTML images for any of the processing steps executed inside tesseract takes a loooong time when outputting otherwise optimal WebP images: the encoding of these takes a considerable amount of time, often *more* than the underlying/observed tesseract run itself! For that reason we switched to outputting PNG instead, while it takes up more disk space (which matters when you do this in bulk and use SSDs for storage (write) speed), alas.
  >
  > You may be interested in issue Wxxx if this is a concern if yours as well.
  >
  
  - it might be a good idea to wipe those long running tests and use the restartability of my current batch test scripts to have those re-run while we can be sure there's no other heavy loads occurring simultaneously, then do the `grep` run once again to see which of these are *false positives* thanks to my own parallel use of this machine.
