#
# script to create the ArXiv submission
#
# please be sure that you run pdflatex paper-hierarchical.tex in the main directory
# before running the script, so paper-hierarchical.bbl and the *pdf files are created

cd /users/srio/Working/paper-hierarchical
rm -rf ARXIV2 ARXIV
mkdir ARXIV
cd ARXIV
cp ../paper-hierarchical.tex .
cp ../paper-hierarchical.bbl .
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
sed -e "s/GRAPHICS\/idealelementsESRF/figure3/" paper-hierarchical.tex -i
sed -e "/idealelementsEBS/d" paper-hierarchical.tex -i
sed -e "/hybridnoerrorsESRF/d" paper-hierarchical.tex -i
sed -e "/hybridnoerrorsEBS/d" paper-hierarchical.tex -i
sed -e "/hybriderrorsESRF/d" paper-hierarchical.tex -i
sed -e "/hybriderrorsEBS/d" paper-hierarchical.tex -i


# figure 4
cp GRAPHICS/wofry1D.png ./figure4.png
sed -e "s/GRAPHICS\/wofry1D.png/figure4.png/" paper-hierarchical.tex -i

# figure 5
cp GRAPHICS/se_idealTE_idealOE_h.pdf ./figure5a.pdf
sed -e "s/GRAPHICS\/se_idealTE_idealOE_h.pdf/figure5a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/ebs_slopeTE_slopeOE_h.pdf ./figure5b.pdf
sed -e "s/GRAPHICS\/ebs_slopeTE_slopeOE_h.pdf/figure5b.pdf/" paper-hierarchical.tex -i

# figure 6
cp GRAPHICS/esrf_idealTE_idealOE_h.pdf ./figure6a.pdf
sed -e "s/GRAPHICS\/esrf_idealTE_idealOE_h.pdf/figure6a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/esrf_slopeTE_slopeOE_h.pdf ./figure6b.pdf
sed -e "s/GRAPHICS\/esrf_slopeTE_slopeOE_h.pdf/figure6b.pdf/" paper-hierarchical.tex -i


# figure 7
cp GRAPHICS/ebs_idealTE_idealOE_h.pdf ./figure7a.pdf
sed -e "s/GRAPHICS\/ebs_idealTE_idealOE_h.pdf/figure7a.pdf/" paper-hierarchical.tex -i
cp GRAPHICS/ebs_slopeTE_slopeOE_h.pdf ./figure7b.pdf
sed -e "s/GRAPHICS\/ebs_slopeTE_slopeOE_h.pdf/figure7b.pdf/" paper-hierarchical.tex -i

# figure 8
cp GRAPHICS/cumulated_occupation.eps ./figure8a.eps
sed -e "s/GRAPHICS\/cumulated_occupation.eps/figure8a.eps/" paper-hierarchical.tex -i
cp GRAPHICS/up_to_mode_id16a.eps ./figure8b.eps
sed -e "s/GRAPHICS\/up_to_mode_id16a.eps/figure8b.eps/" paper-hierarchical.tex -i


# figure 9
cp GRAPHICS/ebs_spectral_density.png ./figure9a.png
sed -e "s/GRAPHICS\/ebs_spectral_density.png/figure9a.png/" paper-hierarchical.tex -i
cp GRAPHICS/figure9b.png ./figure9b.png
sed -e "s/GRAPHICS\/ebs_mode0/figure9b/" paper-hierarchical.tex -i
sed -e "/ebs_mode1.png/d" paper-hierarchical.tex -i
sed -e "/ebs_mode2.png/d" paper-hierarchical.tex -i
sed -e "/ebs_mode3.png/d" paper-hierarchical.tex -i


# figure 10
cp GRAPHICS/propagated_modes.eps ./figure10.eps
sed -e "s/GRAPHICS\/propagated_modes.eps/figure10.eps/" paper-hierarchical.tex -i

# figure 11
cp GRAPHICS/rediagonalized_modes.eps ./figure11.eps
sed -e "s/GRAPHICS\/rediagonalized_modes.eps/figure11.eps/" paper-hierarchical.tex -i

# figure 12
cp GRAPHICS/final_mode0.png ./figure12a.png
cp GRAPHICS/final_mode1.png ./figure12b.png
sed -e "s/GRAPHICS\/final_mode0.png/figure12a.png/" paper-hierarchical.tex -i
sed -e "s/GRAPHICS\/final_mode1.png/figure12b.png/" paper-hierarchical.tex -i

# figure 13
cp GRAPHICS/metrology.eps ./figure13.eps
sed -e "s/GRAPHICS\/metrology.eps/figure13.eps/" paper-hierarchical.tex -i
#sed -e "s/pictures\/ap_occupation.eps/figure6a.pdf/" paper-hierarchical.tex -i
#sed -e "s/pictures\/ap_spectral_density_fraction.eps/figure6b.pdf/" paper-hierarchical.tex -i
#

rm -rf GRAPHICS

pdflatex paper-hierarchical.tex
pdflatex paper-hierarchical.tex
okular paper-hierarchical.pdf
#
