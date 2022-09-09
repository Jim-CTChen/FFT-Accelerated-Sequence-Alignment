from turtle import xcor
import numpy as np
import matplotlib.pyplot as plt
from config import AMINO_ACID_MAPPING, VOLUME_MAPPING, POLARITY_MAPPING

ref = 'HAGWKFTR'
ref = [*ref]

qry = 'YFFWKYTN'
qry = [*qry]

ref_vol = np.array([VOLUME_MAPPING[c] for c in ref]).astype(np.int32)
ref_pol = np.array([POLARITY_MAPPING[c] for c in ref]).astype(np.int32)
print('ref volume')
print(ref_vol)
print('ref polarity')
print(ref_pol)

qry_vol = np.array([VOLUME_MAPPING[c] for c in qry]).astype(np.int32)
qry_pol = np.array([POLARITY_MAPPING[c] for c in qry]).astype(np.int32)
print('qry volume')
print(qry_vol)
print(qry_pol)

vol_xcorr = np.correlate(ref_vol, qry_vol, "full").astype(float)
pol_xcorr = np.correlate(ref_pol, qry_pol, "full").astype(float)
print('volume xcorr')
print(np.array_repr(vol_xcorr).replace('\n', ''))
print('polarity xcorr')
print(np.array_repr(pol_xcorr).replace('\n', ''))
xcorr = (vol_xcorr+pol_xcorr)
print('xcorr')
print(xcorr)
offset = np.arange(len(xcorr)) - len(xcorr)//2


plt.bar(offset, np.array(xcorr), color='k')
plt.xlabel('offset')
plt.ylabel('xcorr')
plt.show()