#include <iostream>

using namespace std;

int main()
{

    // is prime?
    int x;
    int i;
    int log;
    int result;
    log = 0;
    i = 2;
    x = 139;
    int end;
    end = x / 2;
    while (i < end || log == 1)
    {
        int rest;
        rest = x % i;
        if (rest == 0)
        {
            log = 1;
        }
        else
        {
            ;
        }
        i = i + 1;
    }
    if (log == 1)
    {
        result = 0;
    }
    else
    {
        result = 1;
    }
    cout << result << endl;

    // n. fbonacci number
    int a;
    int b;
    int c;
    int n;
    int j;
    a = 1;
    b = 1;
    j = 2;
    n = 13;
    while (j < n)
    {
        c = a + b;
        a = b;
        b = c;
        j = j + 1;
    }
    cout << c;
}