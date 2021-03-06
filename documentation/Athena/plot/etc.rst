..
   Athena document is copyright 2016 Bruce Ravel and released under
   The Creative Commons Attribution-ShareAlike License
   http://creativecommons.org/licenses/by-sa/3.0/

Special plots for XAS data
==========================


Special plots for the current group
-----------------------------------

.. _fig-specialplot:
.. figure:: ../../_images/plot_special.png
   :target: ../_images/plot_special.png
   :align: center

   A number of special plots and other plotting features are provided
   for visualizing particular aspects of your data. The plot types
   described below are all available from the :guilabel:`Plot` menu.

**Quad plot**
    The quad plot is the default plot that gets made when data are
    first imported. Using the current set of processing parameters,
    the data are displayed in energy, k, R, and back-transform k all
    in the same plot window. This plot can also be made by
    right-clicking :mark:`rightclick,..` on the :button:`kq,orange`
    button.

    .. _fig-quadplot:
    .. figure:: ../../_images/plot_quad.png
       :target: ../_images/plot_quad.png
       :align: center

       Quad plot of Fe foil.
       
**Normalized data and derivative**
    This plot type shows the normalized |mu| (E) spectrum along with its
    derivative. The derivative spectrum is scaled by an amount that
    makes it display nicely along with the normalized data.

    .. _fig-ndplot:
    .. figure:: ../../_images/plot_nd.png
       :target: ../_images/plot_nd.png
       :align: center

       Norm and deriv of Fe foil
       
**Data + I0 + signal**
    I\ :sub:`0` can be plotted along with |mu| (E) and the signal as
    shown below. The I\ :sub:`0` and signal channel is among the data
    saved in `a project file <../output/project.html>`__. This example
    shows |mu| (E) of Au chloride along with the signal and I\
    :sub:`0` channels. This plot can also be made by right-clicking on
    the :button:`E,orange` button. (The norm+deriv plot can be configured
    for right-click :mark:`rightclick,..` use with the
    :configparam:`Athena,right\_single\_e` `configuration parameter
    <../other/prefs.html>`__.)

    .. _fig-mui0plot:
    .. figure:: ../../_images/plot_mui0.png
       :target: ../_images/plot_mui0.png
       :align: center

       mu(E) of Au chloride along with the signal and I\ :sub:`0`
       channels.
       
**k123 plot**
    A k123 plot is a way of visualizing the effect of k-weighting on
    the |chi| (k) spectrum. The k\ :sup:`1`-weighted spectrum is scaled
    up to be about the same size as the k\ :sup:`2`-weighted
    spectrum. Similarly, the k\ :sup:`3`-weighted spectrum is scaled
    down. This plot can also be made by right-clicking 
    :mark:`rightclick,..` on the :button:`k,orange` button.

    .. _fig-k123plot:
    .. figure:: ../../_images/plot_k123.png
       :target: ../_images/plot_k123.png
       :align: center

       k123 plot of Fe foil
       
**R123 plot**
    A R123 plot is a way of visualizing the effect of k-weighting on the
    |chi| (R) spectrum. The Fourier transform is made with k-weightings of 1,
    2, and, 3. The FT of the k\ :sup:`1`-weighted spectrum is scaled up to be
    about the same size as the FT or the k\ :sup:`2`-weighted spectrum.
    Similarly, the FT of the k\ :sup:`3`-weighted spectrum is scaled down. The
    current setting in the `R tab <tabs.html#plotting-in-r-space>`__ is
    used to make this plot. For this figure, the magnitude setting was
    selected. This plot can also be made by right-clicking 
    :mark:`rightclick,..` on the :button:`R,orange`
    button.

    .. _fig-r123plot:
    .. figure:: ../../_images/plot_r123.png
       :target: ../_images/plot_r123.png
       :align: center

       R123 plot of Fe foil


Special plots for the marked groups
-----------------------------------

The :menuselection:`Plot --> Marked groups` submenu offers two special kinds of plots relating
to the set of groups in the group list that have been
`marked <../ui/mark.html>`__.

**Bi-Quad plot**
    This special plot is like the quad plot described above, but is
    used to compare two marked groups. To make this plot you must have
    two |nd| and only two |nd| groups selected from the group list. This
    plot can also be made by right-clicking :mark:`rightclick,..` on the
    :button:`q,purple` button.

    .. _fig-biquadplot:
    .. figure:: ../../_images/plot_biquad.png
       :target: ../_images/plot_biquad.png
       :align: center

       A quad plot comparing two marked groups.

**Plot with E0 at 0**
    This special plot is used to visualize |mu| (E) spectra measured at
    different edges. Each spectrum, Cu and Fe in this example, is
    shifted so that its point of E\ :sub:`0` is displayed at 0 on the energy
    axis.

    .. _fig-e00plot:
    .. figure:: ../../_images/plot_e0_0.png
       :target: ../_images/plot_e0_0.png
       :align: center

       Plot of Fe and Cu foils with E0 at 0.
       
**Plot I0 of marked groups**
    This plot allows examination of the I\ :sub:`0` signals of a set
    of marked groups. This plot can also be made by right-clicking on
    the :button:`E,purple` button. (The other two special marked
    groups plots can be configured for right-click
    :mark:`rightclick,..` use with the
    :configparam:`Athena,right\_marked\_e` `configuration parameter
    <../other/prefs.html>`__.)

    .. _fig-i0plot:
    .. figure:: ../../_images/plot_marked_i0.png
       :target: ../_images/plot_marked_i0.png
       :align: center

       The I0 signals of three marked groups
       
**Plot scaled by edge step**
    The marked groups can be plotted as normalized |mu| (E), but scaled by
    the size of the edge step. Without flattening, this is identical to
    plotting the |mu| (E) data with the pre-edge line subtracted. Otherwise,
    it is different in that the post-edge region will be flattened and
    will oscillate around the level of the edge step size.

    .. _fig-scaledplot:
    .. figure:: ../../_images/plot_scaled.png
       :target: ../_images/plot_scaled.png
       :align: center

       Plot of normalized data scaled by edge step.


Special plots for merged groups
-------------------------------

When data are merged, the standard deviation spectrum is also computed
and saved in `project files <../output/project.html>`__. The merged
data can be plotted along with its standard deviation as shown in the
merge section (Figure :numref:`Fig. %s <fig-mergestddev>`) in a couple of
interesting ways.

**Merge + standard deviation**
    In this plot, the merged data are displayed along with the standard
    deviation. The standard deviation has been added to and subtracted
    from the merged data. This is the plot that is displayed by default
    when a merge is made. This behavior is controled by the
    :configparam:`Athena,merge\_plot` `configuration
    parameter <../other/prefs.html>`__.

    .. _fig-stddevplot:
    .. figure:: ../../_images/merge_stddev.png
       :target: ../_images/merge_stddev.png
       :align: center

       A plot of merged data +/- the standard deviation for Au hydroxide
       data
	
**Merge + variance**
    In this plot, the standard deviation spectrum is plotted directly.
    It is scaled to plot nicely with the merged data. The point of this
    plot is to see how the variability in the data included in the merge
    is distributed in energy.

    .. _fig-varianceplot:
    .. figure:: ../../_images/merge_variance.png
       :target: ../_images/merge_variance.png
       :align: center

       A plot of merged data and the variance for Fe foil data



Phase corrected plots
---------------------

When the :guilabel:`phase correction` check button is clicked on, the Fourier
transform for that data group will be made by subtracting the central
atom phase shift. This is an incomplete phase correction |nd| in
:demeter:`athena` we know the central atom but do not necessarily have
any knowledge about the scattering atom.

Note that, when making a phase corrected plot, the window function in R
is not corrected in any way, thus the window will not line up with the
central atom phase corrected |chi| (R).

Also note that the phase correction propagates through to |chi|
(q). While the window function will display sensibly with the central
atom phase corrected |chi| (q), a :button:`kq,orange` plot will be
somewhat less insightful because phase correction is not performed on
the original |chi| (k) data.


XKCD-style plots
----------------

:demeter:`athena` can make plots in a style that resembles the famous
`XKCD comic <http://xkcd.com/>`__.

To make use of this most essential feature, you should first download
and install the `Humor-Sans
font <http://antiyawn.com/uploads/humorsans.html>`__ onto your computer.

Once you have installed the font, simply check :menuselection:`Plot
--> Plot XKCD style`. Enjoy!


.. _fig-xkcd:
.. figure:: ../../_images/plot_xkcd.png
   :target: ../_images/plot_xkcd.png
   :align: center

   A plot sort of in the XKCD style.

