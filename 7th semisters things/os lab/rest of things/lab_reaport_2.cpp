#include <bits/stdc++.h>
using namespace std;

void UniqueID(string studentID) {
    int uniqueCode = 0;
    for (char c : studentID) {
        uniqueCode += (int)c;
    }
    cout << "Unique ID based on Student ID (" << studentID << "): " << uniqueCode << endl;
}

void SJFPreemptive(vector<int> arrivalTimes, vector<int> burstTimes) {
    int n = arrivalTimes.size();
    vector<int> waitingTime(n), turnaroundTime(n), completionTime(n);

    vector<int> remainingTime = burstTimes;
    int complete = 0, currentTime = 0, minRemainingTime = INT_MAX;
    int shortestProcess = 0, finishTime;
    bool foundProcess = false;
    int TotalwatingTime=0;
    while (complete != n) {
        for (int i = 0; i < n; i++) {
            if (arrivalTimes[i] <= currentTime && remainingTime[i] < minRemainingTime && remainingTime[i] > 0) {
                minRemainingTime = remainingTime[i];
                shortestProcess = i;
                foundProcess = true;
            }
        }
        if (!foundProcess) {
            currentTime++;
            continue;
        }

        remainingTime[shortestProcess]--;

        minRemainingTime = remainingTime[shortestProcess];
        if (minRemainingTime == 0) {
            minRemainingTime = INT_MAX;
        }

        if (remainingTime[shortestProcess] ==0 ) {
            complete++;
            foundProcess = false;
            finishTime = currentTime + 1;

            waitingTime[shortestProcess] = finishTime - burstTimes[shortestProcess] - arrivalTimes[shortestProcess];
            if (waitingTime[shortestProcess] < 0) waitingTime[shortestProcess] = 0;
            turnaroundTime[shortestProcess] = finishTime - arrivalTimes[shortestProcess];
            completionTime[shortestProcess] = finishTime;
        }
        currentTime++;
    }

    cout << "\nProcess\tArrival Time\tBurst Time\tWaiting Time\tTurnaround Time\tCompletion Time\n";
    for (int i = 0; i < n; i++) {
        cout << "P" << i + 1 << "\t\t" << arrivalTimes[i] << "\t\t" << burstTimes[i] << "\t\t"
             << waitingTime[i] << "\t\t" << turnaroundTime[i] << "\t\t" << completionTime[i] << endl;
            TotalwatingTime+=waitingTime[i];
    }

    float avg= float(TotalwatingTime)/float(n);
    cout <<"Avarage waiting time : "<<avg;
}

int main() {
    string studentID = "2125051016";
    UniqueID(studentID);

    int a=0,b=0,c=0;
    vector<int> arrivalTimes ;
    vector<int> burstTimes ;
    cout<<"number of process : ";
    cin>>c;

    for(int i= 1; i<=c ;i++){
        cout<<"arrivaltime for process "<<i<< ": ";
        cin>>a;
        arrivalTimes.push_back(a);
        cout<<"brusttime for process " <<i<< ": ";
        cin>>b;
        burstTimes.push_back(b);
    }

    SJFPreemptive(arrivalTimes, burstTimes);

    return 0;
}
