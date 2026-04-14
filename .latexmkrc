$pdf_mode = 1;
$pdflatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex = 'biber %O %B';
$force_mode = 1;
$max_repeat = 5;
$cleanup_includes_generated = 1;
@default_files = ('main.tex');
