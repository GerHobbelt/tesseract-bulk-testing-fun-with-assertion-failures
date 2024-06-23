# Speeding up the batch test script

Currently the batch script waits for all `tesseract` runs in a mini-batch to complete, before firing off another mini-batch, aimed to load all available local CPU cores (16).

However, the observed load looks something like this:

![[assets/taskmgr-tesseract-run1.png]]

which means every mini-batch waits quite a long time because one or two of those `tesseract` invocations are lagging behind -- the right half of the screenshot is ImageMagick runs being fired off; it's the left half that's representative of a batch test behaviour.

## The idea we're going to try

The idea is to wait *for the majority*, i.e. when `ps ax` only sees 2 lingering `tesseracts` runs, we decide to continue with the next mini-batch.

Risks? 
By keeping this number at 2, very slow `tesseract` runs might accumulate, but the same "max 2" check is done at the end of the next mini-batch kick-off, so we won't risk an increasing overdraft; just 2 more than originally estimated 'good behaviour'. 

This should plug those long low valleys some, we hope...
