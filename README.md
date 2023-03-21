# Boxplot
Boxplot with multiple variables

    Box_4: A function that creates a box plot to display the distribution of data across four groups. The function takes four input vectors of data and displays box plots for each group with different fill patterns.
    Box_8: A function similar to Box_4, but with eight groups instead of four.
    Box_16: A function similar to Box_4, but with sixteen groups instead of four.
    Box_24: A function similar to Box_4, but with twenty-four groups instead of four.

All of these functions use the same basic approach to create the box plot, with the main differences being the number of groups and the specific fill patterns used to distinguish between them.


For example, Box_24

This code defines a function named Box_24 that creates a box plot for four datasets, X1, X2, X3, and X4. The function also adds hatch patterns to the boxes to distinguish between the datasets.

The first step in the function is to create groups of data for each dataset. The group10, group50, group90, and group99 variables create groups for the 10th, 50th, 90th, and 99th percentiles of the data. These groups are created by concatenating arrays of zeros and ones, with each element representing a different dataset. For example, the first group includes zeros for the first two columns (representing the first dataset), ones for the next two columns (representing the second dataset), and so on. The group variable concatenates these four groups into a single matrix.

The positions variable sets the horizontal positions of the boxes on the plot. The reshape function is then used to convert the four datasets into vectors, which are concatenated into a single matrix X.

The function then creates a box plot using the boxplot function, with the group and positions variables specifying the grouping and positions of the boxes. The Hatch_fill2 function is used to add hatch patterns to the boxes, with different patterns used for each dataset. The function also sets various properties of the plot, such as the font size, tick labels, and legend.

Finally, the function adds some vertical lines to the plot to separate the boxes for the different percentiles. It also adds a horizontal line at y=1 to indicate the expected value of the data, and sets the y-axis limits to be between 0.9 and 1.6.