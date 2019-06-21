#
# script to create the ArXiv submission
#
# please be sure that you run compile.sh in the main directory before running 
# this script, so paper-hierarchical.bbl and the GRAPHICS/*eps-converted-to.pdf files 
# are created
#

cd /users/srio/Working/paper-hierarchical
rm -rf JSR JSR
mkdir JSR
cd JSR
cp ../paper-hierarchical.tex .
#cp ../paper-hierarchical.bbl .
cp ../iucr.cls .
cp ../harvard.sty .
cp ../siunitx.sty .
cp ../siunitx-abbreviations.cfg .
cp ../tableUndulator.txt .
cp ../tableElectron.txt .

cp -r ../GRAPHICS .

cp paper-hierarchical.tex paper-hierarchical.tex.orig

# biblio
# sed -e "s.^\\\\bibliography{references}.\\\\input{paper-hierarchical\.bbl}." paper-hierarchical.tex -i
pdflatex paper-hierarchical.tex
bibtex paper-hierarchical
sed -e "s.\\\\bibliographystyle.\\% \\\\bibliographystyle.g" paper-hierarchical.tex -i
sed -e "s.^\\\\bibliography{references}.\\% \\\\bibliography{references}." paper-hierarchical.tex -i
sed -e "s.^\\\\end{document}.\\% \\\\end{document}." paper-hierarchical.tex -i
cat ../paper-hierarchical.bbl >> paper-hierarchical.tex
echo "\end{document}" >> paper-hierarchical.tex


# figure 1
cp GRAPHICS/ID16A.pdf ./figure1.pdf
sed -e "s/GRAPHICS\/ID16A.pdf/figure1.pdf/" paper-hierarchical.tex -i

# figure 2
cp GRAPHICS/fluxU18.png ./figure2.png
sed -e "s/GRAPHICS\/fluxU18.png/figure2.png/" paper-hierarchical.tex -i

# figure 3
cp GRAPHICS/figure3.png ./figure3.png
sed -e "s/GRAPHICS\/figure3/figure3/" paper-hierarchical.tex -i

# figure 4
cp GRAPHICS/wofry1D.png ./figure4.png
sed -e "s/GRAPHICS\/wofry1D.png/figure4.png/" paper-hierarchical.tex -i

# figure 5
cp GRAPHICS/filament_beam_ideal.pdf ./figure5a.pdf
sed -e "s/GRAPHICS\/filament_beam_ideal.png/figure5a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/filament_beam_real.pdf ./figure5b.pdf
sed -e "s/GRAPHICS\/filament_beam_real.png/figure5b.pdf/" paper-hierarchical.tex -i

# figure 6
cp GRAPHICS/ESRF_ideal.pdf ./figure6a.pdf
sed -e "s/GRAPHICS\/ESRF_ideal.png/figure6a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/ESRF_real.pdf ./figure6b.pdf
sed -e "s/GRAPHICS\/ESRF_real.png/figure6b.pdf/" paper-hierarchical.tex -i


# figure 7
cp GRAPHICS/EBS_ideal.pdf ./figure7a.pdf
sed -e "s/GRAPHICS\/EBS_ideal.png/figure7a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/EBS_real.pdf ./figure7b.pdf
sed -e "s/GRAPHICS\/EBS_real.png/figure7b.pdf/" paper-hierarchical.tex -i

# figure 8
cp GRAPHICS/cumulated_occupation-eps-converted-to.pdf ./figure8a.pdf
sed -e "s/GRAPHICS\/cumulated_occupation.eps/figure8a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/up_to_mode_id16a-eps-converted-to.pdf ./figure8b.pdf
sed -e "s/GRAPHICS\/up_to_mode_id16a.eps/figure8b.pdf/" paper-hierarchical.tex -i


# figure 9
cp GRAPHICS/ebs_spectral_density.png ./figure9a.png
cp GRAPHICS/figure9b.png ./figure9b.png
sed -e "s/GRAPHICS\/ebs_spectral_density.png/figure9a.png/" paper-hierarchical.tex -i
sed -e "s/GRAPHICS\/figure9b/figure9b/" paper-hierarchical.tex -i

# figure 10
cp GRAPHICS/propagated_modes-eps-converted-to.pdf ./figure10.pdf
sed -e "s/GRAPHICS\/propagated_modes.eps/figure10.pdf/" paper-hierarchical.tex -i

# figure 11
cp GRAPHICS/rediagonalized_modes-eps-converted-to.pdf ./figure11.pdf
sed -e "s/GRAPHICS\/rediagonalized_modes.eps/figure11.pdf/" paper-hierarchical.tex -i

# figure 12
cp GRAPHICS/final_mode0.png ./figure12a.png
cp GRAPHICS/final_mode1.png ./figure12b.png
sed -e "s/GRAPHICS\/final_mode0.png/figure12a.png/" paper-hierarchical.tex -i
sed -e "s/GRAPHICS\/final_mode1.png/figure12b.png/" paper-hierarchical.tex -i

# figure 13
cp GRAPHICS/metrology.pdf ./figure13.pdf
sed -e "s/GRAPHICS\/metrology.pdf/figure13.pdf/" paper-hierarchical.tex -i

rm -rf GRAPHICS

pdflatex paper-hierarchical.tex
pdflatex paper-hierarchical.tex
okular paper-hierarchical.pdf
#
