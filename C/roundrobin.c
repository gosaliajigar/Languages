#include<stdio.h> 

void init(int arrival_time[], int burst_time[], int remaining_time[]) {
  arrival_time[0]=0;arrival_time[1]=1;arrival_time[2]=2;arrival_time[3]=3;
  burst_time[0]=9;burst_time[1]=5;burst_time[2]=3;burst_time[3]=4;
  remaining_time[0]=9;remaining_time[1]=5;remaining_time[2]=3;remaining_time[3]=4;
}

int user_input() {
  int isValid=0, quantum;
  while(isValid==0) {
    printf("\nEnter Time Quantum(>0)           : "); 
    scanf("%d", &quantum); 
    if (quantum>0) {
      isValid=1;
    } else {
      printf("ERR: Invalid Time Quantum        : %d", quantum); 
    }
  }
  return quantum;
}
 
void record_execution(int start, int end, int process_number, int execution[]) {
  int i=start,j=start+end;
  while(i<j) {
    execution[i++]=process_number; 
  }
}

void display_execution(int total, int execution[]) {
  int counter;
  printf("---------------------------------\n");
  printf("  TIME\t|  PROCESS EXECUTING\n"); 
  printf("---------------------------------\n");
  for(counter=0;counter<total;counter++){
    printf("    %d\t|\tP[%d]\n", counter, execution[counter]);
  }
  printf("---------------------------------\n");
}

void display_statistics(int time_quantum, int time, int wait_time, int turnaround_time, int no_of_processes, int sequence[], int sequence_count) {
  int counter;
  printf("---------------------------------------------------------------------\n");
  printf("                               STATISTICS                            \n");
  printf("---------------------------------------------------------------------\n");
  printf("Time Quantum for Round-Robin     : %d\n", time_quantum);
  printf("Sequence of processes execution  : ");
  for(counter=0;counter<sequence_count;counter++){
      printf("P[%d] ", sequence[counter]);
  }
  printf("\n");
  printf("Total Exceution Time             : %d\n",time); 
  printf("Average Waiting Time             : %.2f\n",wait_time*1.0/no_of_processes); 
  printf("Average Turnaround Time          : %.2f\n",turnaround_time*1.0/no_of_processes); 
  printf("\n---------------------------------------------------------------------\n");
  printf("\n");
}

void display_header() {
  printf("\n");
  printf("---------------------------------------------------------------------\n");
  printf("                   SEQUENCE OF PROCESS COMPLETION                    \n");
  printf("---------------------------------------------------------------------\n");
  printf("Process\t|  Arrival Time |  Burst Time   |Turnaround Time|Waiting Time\n"); 
  printf("--------|---------------|---------------|---------------|------------\n");
}

int main() { 
  // default fields
  int no_of_processes=4, isProcessComplete=0, wait_time=0, turnaround_time=0;

  // processed fields
  int process_number, time, pending_process, time_quantum, sequence_count; 

  // process arrays
  int arrival_time[no_of_processes], burst_time[no_of_processes], remaining_time[no_of_processes]; 

  // sequence of processes
  int sequence[1000], execution[1000];

  pending_process=no_of_processes; 

  init(arrival_time, burst_time, remaining_time);

  time_quantum = user_input();

  display_header();

  for(time=0,process_number=0,sequence_count=0;pending_process!=0;) { 
    if(remaining_time[process_number]>0) { 
      record_execution(time, remaining_time[process_number], process_number+1, execution);
      if(remaining_time[process_number]<=time_quantum) { 
        time+=remaining_time[process_number]; 
        remaining_time[process_number]=0; 
        isProcessComplete=1; 
      } else { 
        remaining_time[process_number]-=time_quantum; 
        time+=time_quantum; 
      }
      sequence[sequence_count++]=process_number + 1;
    } 
    if(remaining_time[process_number]==0 && isProcessComplete==1) { 
      pending_process--; 
      printf("P[%d]\t|\t%3d\t|\t%3d\t|\t%3d\t|\t%3d\t\n",process_number+1,arrival_time[process_number],burst_time[process_number],time-arrival_time[process_number],time-arrival_time[process_number]-burst_time[process_number]); 
      wait_time+=time-arrival_time[process_number]-burst_time[process_number]; 
      turnaround_time+=time-arrival_time[process_number]; 
      isProcessComplete=0; 
    } 

    if(process_number==no_of_processes-1) 
      process_number=0; 
    else if(arrival_time[process_number+1]<=time) 
      process_number++; 
    else 
      process_number=0; 
  } 

  printf("---------------------------------------------------------------------\n\n");

  display_execution(time, execution);

  display_statistics(time_quantum, time, wait_time, turnaround_time, no_of_processes, sequence, sequence_count);
  
  return 0; 
}
