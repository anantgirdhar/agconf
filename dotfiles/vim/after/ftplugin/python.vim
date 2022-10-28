setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4
setlocal expandtab

iabbrev <buffer> inp import numpy as np
iabbrev <buffer> iplt import matplotlib.pyplot as plt
iabbrev <buffer> impl import matplotlib as mpl
iabbrev <buffer> isci import scipy as sp
iabbrev <buffer> ict import cantera as ct
iabbrev <buffer> ipd import pandas as pd
iabbrev <buffer> ixr import xarray as xr
iabbrev <buffer> ipt import pytest
iabbrev <buffer> prop @property
iabbrev <buffer> ptf @pytest.fixture
iabbrev <buffer> ptaf @pytest.fixture(scope="function", autouse=True)
iabbrev <buffer> usefix @pytest.mark.usefixtures()<++><Esc>4hi
iabbrev <buffer> ipdb import pdb<CR>pdb.set_trace()
