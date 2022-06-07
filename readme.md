# Readme ( Task Management )

> author: Terry Yu
> email: terry_yu@arcadyan.com.tw



[toc]

## Brief 

Task Management is a framework for reports generator based on a task database. 
This framework is on the fly. Therefore, many things need to design, implemented, and delivered.

Follow sections are shown below expression:

Section 1 [TODO](#TODO): List all the todo.
Section 2 [Layout](#Layout): Show the layout of the framework via a tree diagram.



## TODO

- [ ] Complete Appendix A. Terminologies.
- [ ] Design table format.
- [ ] Design task naming rule.
- [ ] Design project generator.





## Layout

 ```shell
 /home/terry/Documents/task_management
 ├── report/			# store the reports
 ├── table/			# store the table recording details of task
 │   ├── table.csv
 │   └── table.md
 ├── tasks/			# store the tasks.
 ├── utils/			# store the useful tools.
 │   └── generate_report_template.sh		# generate project automatically.
 └── readme.md		# it's this markdown.
 
 4 directories, 4 files
 ```



## Table Format

Table 1. Task Management Table content.

| TASK_ID | TASK_NAME                     | ATTRIBUTE | NOTE |
| ------- | ----------------------------- | --------- | ---- |
| 000-00  | dhcp_capture_option43_content | feature   |      |
| 000-01  | study_dhcp_option_background  | feature   |      |
| 000-02  | study_packet_sniffer          | feature   |      |
| 000-03  | implement_feature             | feature   |      |
| 001     | ???                           | issue     |      |
| 002     | ???                           | issue     |      |
| 003     | ???                           | others    |      |
| ...     | ...                           | ...       | ...  |

> Task ID: \<major number\> - \<minor number\>
>
> Attribute: issue, feature, others



## Task Database

Naming Rule shows below expression:

```shell
## generic task folder name
TASK_FOLDER_NAME=${TASK_ID}_${TASK_NAME}

## standalone task ( TASK_ID=${major_number} )
## single task
## e.g. 003_config_issue
TASK_ID=${major_number}

## series task  
## gather related task together
## e.g. 002-000_implement_dhcp_option43_content_feature
##		002-001_study_dhcp_option
##		002-002_implement_packet_sniffer
TASK_ID=${major_number}-${minor_number}
```

> Note: The difference between standalone task and series task is on TASK_ID. The TASK_ID of the standalone task doesn't have a minor number, but the TASK_ID of the series task has.








## Appendix A. Terminologies

| No.  | Terminology | Description |
| ---- | ----------- | ----------- |
| 1    | task        |             |
| 2    | report      |             |
| 3    | table       |             |

