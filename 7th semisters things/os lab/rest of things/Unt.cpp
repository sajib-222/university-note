
#include <bits/stdc++.h>
using namespace std;

void UniqueID(string studentID) {
    int uniqueCode = 0;
    for (char c : studentID) {
        uniqueCode += (int)c;
    }
    cout << "Unique ID based on Student ID (" << studentID << "): " << uniqueCode << endl;
}

struct Process {
    int pid;
    int arrivalTime;
    int burstTime;
    int completionTime;
    int waitingTime;
    int turnaroundTime;
};

bool compare(Process a, Process b) {
    if (a.arrivalTime == b.arrivalTime)
        return a.burstTime < b.burstTime;
    return a.arrivalTime < b.arrivalTime;
}

void SJFNonPreemptive(vector<Process> &processes) {
    int n = processes.size();
    int currentTime = 0;
    vector<bool> isCompleted(n, false);

    sort(processes.begin(), processes.end(), compare);

    for (int i = 0; i < n; i++) {
        int shortestProcess = -1;
        int minBurstTime = INT_MAX;

        for (int j = 0; j < n; j++) {
            if (processes[j].arrivalTime <= currentTime && !isCompleted[j] && processes[j].burstTime < minBurstTime) {
                minBurstTime = processes[j].burstTime;
                shortestProcess = j;
            }
        }

        if (shortestProcess != -1) {
            currentTime += processes[shortestProcess].burstTime;
            processes[shortestProcess].completionTime = currentTime;
            processes[shortestProcess].turnaroundTime = processes[shortestProcess].completionTime - processes[shortestProcess].arrivalTime;
            processes[shortestProcess].waitingTime = processes[shortestProcess].turnaroundTime - processes[shortestProcess].burstTime;
            isCompleted[shortestProcess] = true;
        } else {
            currentTime++;
        }
    }
    cout << "\nProcess\tArrival Time\tBurst Time\tWaiting Time\tTurnaround Time\tCompletion Time\n";
    for (int i = 0; i < n; i++) {
        cout << "P" << processes[i].pid << "\t\t" << processes[i].arrivalTime << "\t\t"
             << processes[i].burstTime << "\t\t" << processes[i].waitingTime << "\t\t"
             << processes[i].turnaroundTime << "\t\t" << processes[i].completionTime << endl;
    }
    double totalWaitingTime = 0, totalTurnaroundTime = 0;
    for (int i = 0; i < n; i++) {
        totalWaitingTime += processes[i].waitingTime;
        totalTurnaroundTime += processes[i].turnaroundTime;
    }
    cout << "\nAverage Waiting Time: " << totalWaitingTime / n << endl;
    cout << "Average Turnaround Time: " << totalTurnaroundTime / n << endl;
}

int main() {
    string studentID = "2125051007";
    UniqueID(studentID);
    int n;
    cout << "Enter the number of processes: ";
    cin >> n;

    vector<Process> processes(n);
    for (int i = 0; i < n; i++) {
        cout << "Enter Arrival Time and Burst Time for Process " << i + 1 << ": ";
        processes[i].pid = i + 1;
        cin >> processes[i].arrivalTime >> processes[i].burstTime;
    }
    SJFNonPreemptive(processes);

    return 0;
}
