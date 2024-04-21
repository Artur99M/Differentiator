#include <stdio.h>
#include "../header/Get.h"
#include "../header/read.h"
#include "../DEBUG/def.h"
#include "../Onegin/header/txtdtor.h"
#include "../Tree1/header/tree.h"
#include "../header/TeX.h"
#include "../header/Diff.h"
#include "../header/SimpleTreeExp.h"
#include "../header/graphviz.h"
#include <stdlib.h>

int main()
{

    text txt = read ("data/file.txt");
    PRINT_DEBUG ("txt.nimlines = %lu\n", txt.numlines);
    Node* x = GetG(txt.line[0].str);
    SimplTree (x);
    TreePrint (x);
    Graphviz (x, "graphviz/Tree");
    txtDtor (&txt);

    Node* diff = Diff (x);
    Graphviz (diff, "graphviz/Tree2");
    SimplTree (diff);
    Graphviz (diff, "graphviz/Tree3");
    FILE* TeX_file = fopen ("TeX/TeX.tex", "w");
    fprintf (TeX_file, "В конечном итоге результате:\n");
    TEX_PRINT (diff);

    fclose (TeX_file);
    TreeDtor (diff);
}
