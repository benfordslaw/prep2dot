# prep2dot
AWK script to convert AMBER Prep molecules to graphviz DOT files suitable for visualization.
# Usage
```bash
awk -f prep2dot.awk PREP_FILE MOL_NAME
```
This will output a graph in Graphviz [DOT language](https://graphviz.org/doc/info/lang.html) to stdout.
# Example
To visualize [Glycam](http://legacy.glycam.org/docs/aboutus/)'s `0YB` form of [*N*-Acetylglucosamine](https://en.wikipedia.org/wiki/N-Acetylglucosamine)
(found in the prep file [linked here](http://legacy.glycam.org/docs/forcefield/all-parameters/))
as an SVG,
```bash
awk -f prep2dot.awk GLYCAM_06j-1.prep 0YB | dot -Tsvg -Kneato > 0YB.svg
```
This produces the following SVG:
<p align="center"><image src="0YB.svg" height=500px></p>
