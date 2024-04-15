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
#include <unistd.h>
#include <stdlib.h>

int main()
{

    PRINT_DEBUG ("bark\n");
    text txt = read ("data/file.txt");
    PRINT_DEBUG ("txt.nimlines = %lu\n", txt.numlines);
    Node* x = GetG(txt.line[0].str);
    SimplTree (x);
    TreePrint (x);
    Graphviz (x, "graphviz/Tree");
    txtDtor (&txt);
    // TEX_PRINT (x);
    // Graphviz (x, "graphviz/Tree.dot");
    Node* diff = Diff (x);
    // usleep (50000);
    // TreeFPrint (diff, "a.txt");
    // Graphviz (diff, "graphviz/Tree");
    // Graphviz (diff, "graphviz/Tree2");
    SimplTree (diff);
    Graphviz (diff, "graphviz/Tree3");
    // TreePrint (diff);
    TEX_PRINT (diff);
    // SimplTree(x);


}
