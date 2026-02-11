
#include "../include/proc.h"
#include <linux/uaccess.h> // per copy_from_user



static int tasklist_show(struct seq_file *m , void *v){
	struct task_struct *task;
	int count =0;
	for_each_process(task){
		count++;
		seq_printf(m, "PID : %d | COMM : %s | PRIO : %d | STATE : %d \n ",task->pid,task->comm, task->prio , task_state_index(task) );
	}
	seq_printf(m,"Total Task: %d\n",count);
	return 0;
}


static int tasklist_open(struct inode *inode,struct file *file){
	
	return single_open(file,tasklist_show,NULL);
}


static ssize_t task_write(struct file *file,const char __user *buf,size_t count,loff_t *ppos){

	char kbuf[16];
	if(count > 15)
		count = 15;
	
	if(copy_from_user(kbuf,buf,count))
		return -EFAULT;
	kbuf[count]='\n';
	
	printk(KERN_INFO "%s\n", kbuf);
	return count;
}


static const struct proc_ops tasklist_fops ={

	.proc_open = tasklist_open,
	.proc_read = seq_read,
	.proc_write = task_write,
	.proc_release = single_release,

};

void print_process(void){
	
	if(!proc_create("tasklist",0666,NULL,&tasklist_fops))
		printk(KERN_INFO "ERROR, not created");


	printk(KERN_INFO "YES, created");

}

void tasklist_remove(void){

	remove_proc_entry("tasklist",NULL);
}

