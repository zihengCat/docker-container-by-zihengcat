# ---------------------------
import os
from datetime import datetime, timedelta
# ---------------------------
import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.models import Variable
# -------------------------
default_args_by_ziheng = {
    'owner': 'ziheng',
    'depends_on_past': False,
    'start_date': airflow.utils.dates.days_ago(1),
    #'start_date': datetime.now(),
    'email': None,
    'email_on_failure': False,
    'email_on_retry': False,
    'retry_delay': timedelta(minutes=1),
    'retries': 0,
    #'schedule_interval': None,
    #'queue': 'bash_queue',
    #'pool': 'backfill',
    #'priority_weight': 10,
    #'end_date': datetime(2016, 1, 1),
}
# ----------
# ** NOTE **
# ----------
# USE `variable` AFTER `initdb` OR `resetdb`
# Set `TEST_VARIABLE` from Web UI or CLI
# -------------------------
task_var = "Default_Task_Variable"
# -------------------------
#task_var = Variable.get("TEST_VARIABLE")
# -------------------------
dag = DAG(dag_id = 'Local_Tasks_Example',
          description='本地任务示例 DAG',
          default_args = default_args_by_ziheng,
          schedule_interval = "0 * * * *"
)
# -------------------------
dag.doc_md = """
# Apache Airflow 示例 DAG

展示**有向图依赖DAG**、**定时任务**、**并发执行**、**日志记录**、**变量替换**等高级特性。

"""
# ----------------------------------------------------------------------
# t1, t2 and t3 are examples of tasks created by instantiating operators
# ----------------------------------------------------------------------
cmd_str_1 = '''
    echo "Task 1 is running!" && \
    sleep 2 && echo "TEST_VARIABLE => %s" && sleep 1s && \
    echo "Task 1 is Done!"
''' % task_var
# -------------------
t1 = BashOperator(
     task_id='task1_by_p1',
     bash_command=cmd_str_1,
     retries=0,
     dag=dag
)
# -------------------
cmd_str_2 = '''
    echo "Task 2 is running!" && \
    sleep 2 &&
    echo "Task 2 is Done!"
'''
# -------------------
t2 = BashOperator(
     task_id='task2_by_p2',
     bash_command=cmd_str_2,
     retries=0,
     dag=dag
)
# -------------------
cmd_str_3 = '''
    echo "Task 3 is running!" && \
    sleep 2 &&
    # remove an `unknown` file
    echo "Task 3 is Done!"
    #&& rm 'unknown.file'
'''
# -------------------
t3 = BashOperator(
     task_id='task3_by_p3',
     bash_command = cmd_str_3,
     retries=0,
     dag=dag
)
# -------------------
cmd_str_4 = '''
    echo "Task 4 is running!" && \
    sleep 2 &&
    echo "Task 4 is Done!"
'''
# -------------------
t4 = BashOperator(
     task_id='task4_by_p4',
     bash_command = cmd_str_4,
     retries=0,
     dag=dag
)
# -------------------
cmd_str_5 = '''
    echo "Task 5 is running!" && \
    sleep 2 &&
    echo "Task 5 is Done!"
'''
# -------------------
'''
f_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),
        'local_tasks_example_by_ziheng.sh'
)
with open(f_path, 'rt') as f:
    cmd_str_5 = f.read()
'''
# -------------------
t5 = BashOperator(
     task_id='task5_by_p5',
     bash_command = cmd_str_5,
     retries=0,
     dag=dag
)
# -----------------
t2.set_upstream(t1)
t3.set_upstream(t1)
t4.set_upstream(t1)
t5.set_upstream([t2, t3, t4])
