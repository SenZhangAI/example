#include<stdio.h>

void print_list(int data[], int len) {
    int i;
    for(i = 0; i < len; i++) {
        printf("%d ",data[i]);
    }
    printf("\n");
}

void swap(int v[], int i, int j) {
    int tmp;
    tmp = v[i];
    v[i] = v[j];
    v[j] = tmp;
}

// this version is not quick, but simple
//
// v[begin, end)
// @param begin: first element of a list
// @param end: next to the last element of a list
void qsort(int v[], int begin, int end) {
    int i, last;
    if (begin >= end - 1)
        return;

    swap(v, begin, (begin + end) / 2);
    last = begin;
    for (i = begin + 1; i < end; i++) {
        if (v[i] < v[begin])
            swap(v, ++last, i);
    }
    swap(v, begin, last);

    qsort(v, begin, last);
    qsort(v, last + 1, end);
}

#define LENGTH(list) ((sizeof(list)) / (sizeof(list[0])))

int main(int argc, char* argv[]) {
    int data[] = {9, 4, 3, 5, 6, 1, 7, 2, 8, 10, -1, 0};
    int len = LENGTH(data);

    print_list(data, len);

    qsort(data, 0, len);

    print_list(data, len);
    return 0;
}
