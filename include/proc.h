


#ifndef PROC_H
#define PROC_H

#include <linux/seq_file.h> //seq_file
#include <linux/proc_fs.h> // proc_create,remove_proc_entry
#include <linux/sched/signal.h> // for_each_process
#include <linux/kernel.h>
#include <linux/module.h>



void print_process(void);
void tasklist_remove(void);


#endif 
