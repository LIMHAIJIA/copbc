#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[50];
    time_t start_time;
    time_t end_time;
    double elapsed_seconds;
} TimeRecord;

void start_timer(TimeRecord *record, const char *task_name) {
    strcpy(record->name, task_name);
    record->start_time = time(NULL);
    printf("[%s] Timer started for: %s\n", __func__, task_name);
}

void stop_timer(TimeRecord *record) {
    record->end_time = time(NULL);
    record->elapsed_seconds = difftime(record->end_time, record->start_time);
    printf("[%s] Timer stopped. Elapsed: %.2f seconds\n", __func__, record->elapsed_seconds);
}

void print_report(TimeRecord *records, int count) {
    printf("\n=== Time Monitoring Report ===\n");
    for (int i = 0; i < count; i++) {
        printf("Task: %s | Duration: %.2f seconds\n", 
               records[i].name, records[i].elapsed_seconds);
    }
}

int main() {
    TimeRecord records[10];
    int count = 0;

    start_timer(&records[count], "Task 1");
    sleep(2);
    stop_timer(&records[count]);
    count++;

    start_timer(&records[count], "Task 2");
    sleep(3);
    stop_timer(&records[count]);
    count++;

    print_report(records, count);

    return 0;
}