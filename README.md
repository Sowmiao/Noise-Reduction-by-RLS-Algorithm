# Noise-Reduction-by-RLS-Algorithm

Introduction:
Noise generally is prevalent in major applications related to audio, speech, human
machine interfaces, hearing aids and many others like these. The signal picked up
by the microphone is generally contaminated by noise. Thus, it becomes quite
necessary to remove this noise component from the signal. This process of clearing
out the noise from the signal is called noise reduction.
There are several filtering methods to reduce noise. The filtering method used in
this project to remove noise is, Adaptive Filters. One major advantage of using
adaptive filters is that it removes noise from the environment without the need for
any signal statistics.
To implement this filter much more efficiently RLS algorithm is used. Recursive
Least Squares Algorithm, iteratively finds the adaptive filter coefficients that can
minimize linear squares cost function which is related to the input signals. RLS
algorithm has the ability to adjust the coefficients of the filter even though the
signal statistics of the input signal is not available. The algorithm is seen to
produce satisfactory results.

Methodology:

➢ The Noise input is expressed as the sum of pure speech and noise. Once the
filtering is done it is the pure speech that must be obtained as the obtained.
This is the major objective of this project.
➢ A reference noise is given as an input to the FIR Filter. The coefficients of
the filter at instant n is represented as w^(n). These coefficients are updated
on a regular basis by the use of the RLS algorithm.
➢ When y(n), the output from the filter comes out to be close to the noise
present in the input speech then good results are obtained. Also, when both
the reference noise and the environment noise are highly uncorrelated with
the speech input we can obtain efficient results.

Desired Settings:

➢ Generally it is desired to operate the RLS algorithm in a non-stationary
environment. The filter coefficient vector takes on a time varying form
w^(n).
➢ λ <1 for non stationary environments.
• Anomalies of operating in stationary Environment
➢ In this case the RLS Algorithm produces zero mean squared error. But,
when λ <1, the exponentially weighted least squares estimate w^(n) to be
inconsistent. This causes noise to appear in regular intervals. This deviates
from the optimal settings.
➢ Generally this anomaly is a measure of performance of an adaptive filter
algorithm when operating in a non stationary field. Consequently, lesser the
anomaly better is the performance of the algorithm. The anamoly due to
misadjustment produced is expressed as follows:

M =(1−λ/1+λ)*L

Steps:
➢ The speech input and the noise input were separately recorded for a duration
of 5s. The sampling rate used was 8000 Hz.
➢ The experiment was done by recording a voice input to which a Gaussian
noise was added.
➢ The RLS algorithm was used which was used for updating necessary
parameters at regular intervals of time.
➢ After a large number of iterations, the error signal obtained was the desired
signal. The results in each case were plotted.

Conclusion:
➢ From the results it is seen that RLS works better in non-stationary
environment.
➢ RLS algorithm converges faster than LMS and NLMS algorithms
➢ The value of the forgetting factor λ should be chosen with care. Fast
Adaptation of the RLS algorithm, in general, results in a more noisy
adaptive process.
➢ Another parameter that can be accessed to see if noise reduction is obtained
is by varying the filter order. Different Variations in the filter order provide
different levels of noise reduction.
