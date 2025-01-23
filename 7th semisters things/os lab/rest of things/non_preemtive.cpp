#include <bits/stdc++.h>
using namespace std;
void UniqueID(string studentID) {
    int uniqueCode = 0;
    for (char c : studentID) {
        uniqueCode += (int)c;
    }
    cout << "Unique ID based on Student ID (" << studentID << "): " << uniqueCode << endl;
}

int main() {
    string studentID = "2125051016";
    UniqueID(studentID);
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;
    vector<int> arrival(n);
    vector<int> burst(n);
    vector<int> waiting(n);
    vector<int> turnaround(n);

    for (int i = 0; i < n; i++) {
        cout << "Enter arrival time for process " << (i + 1) << ": ";
        cin >> arrival[i];
        cout << "Enter burst time for process " << (i + 1) << ": ";
        cin >> burst[i];
    }
    waiting[0] = 0;
    for (int i = 1; i < n; i++) {
        waiting[i] = burst[i - 1] + waiting[i - 1] + (arrival[i] - (arrival[i - 1] + burst[i - 1]));
        if (waiting[i] < 0) {
            waiting[i] = 0;
        }
    }
    for (int i = 0; i < n; i++) {
        turnaround[i] = waiting[i] + burst[i];
    }
    cout << fixed << setprecision(2);
    cout << "\nProcess\tArrival\tBurst\tWaiting\tTurnaround\n";
    for (int i = 0; i < n; i++) {
        cout << "P" << (i + 1) << "\t" << arrival[i] << "\t" << burst[i] << "\t"
             << waiting[i] << "\t" << turnaround[i] << endl;
    }
    double total_waiting_time = 0, total_turnaround_time = 0;
    for (int i = 0; i < n; i++) {
        total_waiting_time += waiting[i];
        total_turnaround_time += turnaround[i];
    }
    cout << "Average Waiting Time: " << (total_waiting_time / n) << endl;
    cout << "Average Turnaround Time: " << (total_turnaround_time / n) << endl;

    return 0;
}
