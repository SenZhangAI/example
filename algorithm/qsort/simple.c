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
void qsort(int v[], int left, int right) {
    int i, last;
    if (left >= right)
        return;

    swap(v, left, (left + right) / 2);
    last = left;
    for (i = left + 1; i <= right; i++) {
        if (v[i] < v[left])
            swap(v, ++last, i);
    }
    swap(v, left, last);

    qsort(v, left, last - 1);
    qsort(v, last + 1, right);
}

#define LENGTH(list) ((sizeof(list)) / (sizeof(list[0])))

int main(int argc, char* argv[]) {
    int data[] = {9, 4, 3, 5, 6, 1, 7, 2, 8, 10, -1, 0};
    int len = LENGTH(data);

    print_list(data, len);

    qsort(data, 0, len -1);

    print_list(data, len);
    return 0;
}
