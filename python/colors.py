import matplotlib as mpl
import matplotlib.pylab as plt

cmap0 = mpl.colors.LinearSegmentedColormap.from_list(
        'green2red', ['green', 'orangered'])
cmap1 = mpl.colors.LinearSegmentedColormap.from_list(
        'unevently divided', [(0, 'b'), (.3, 'gray'), (1, 'green')])

# plot
fig, axs = plt.subplots(2, 1)
norm = mpl.colors.Normalize(vmin=0, vmax=1)
cbar = axs[0].figure.colorbar(
            mpl.cm.ScalarMappable(norm=norm, cmap=cmap0),
            ax=axs[0], fraction=.1)
cbar = axs[1].figure.colorbar(
            mpl.cm.ScalarMappable(norm=norm, cmap=cmap1),
            ax=axs[1], fraction=.1)
plt.show()