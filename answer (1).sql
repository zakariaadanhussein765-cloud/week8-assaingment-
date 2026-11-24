/*
===============================================================================
POWER LEARN PROJECT (PLP)
WEEK 8 ASSIGNMENT: MYSQL DATABASE BACKUP
Topic: Database Backup Using mysqldump

Submission file: answer.sql
Database used in the assignment: sales
MySQL account: root

IMPORTANT EXECUTION NOTE
------------------------
The commands in this assignment are operating-system terminal commands, not
SQL statements. They are intentionally written inside SQL comments so this
required answer.sql file remains safe to open in MySQL Workbench.

To test the commands:
  1. Open Windows Command Prompt or PowerShell.
  2. Run each command separately.
  3. Enter the MySQL root password when prompted.
  4. The backup .sql files will be created in the terminal's current folder.

The assignment text supplied includes full instructions for Questions 1 and 2.
It mentions data-only backups in the learning objectives, but does not show
the full wording of Question 3. Question 3 below is therefore prepared as a
clearly labelled data-only backup solution based on that learning objective.
Please compare it with the original PLP Question 3 before final submission.
===============================================================================
*/


/* ============================================================================
   QUESTION 1: BACK UP THE SALES DATABASE
   ============================================================================

   COMMAND (run in Command Prompt or PowerShell):

   mysqldump -u root -p --routines --triggers --events sales > sales_backup.sql

   EXPLANATION:
   - mysqldump: starts MySQL's database export utility.
   - -u root: connects using the MySQL account named root.
   - -p: prompts for the root account password securely.
   - --routines: includes stored procedures and functions.
   - --triggers: includes table triggers.
   - --events: includes scheduled events.
   - sales: identifies the database to back up.
   - > sales_backup.sql: writes the exported backup to this file.

   WHY REGULAR BACKUPS ARE IMPORTANT:
   Regular backups help recover data after accidental deletion, hardware
   failure, software problems, corruption, or other unexpected incidents.
   They also support data recovery and business continuity.

   RESTORE EXAMPLE (run in the terminal when a restore is required):

   mysql -u root -p sales < sales_backup.sql

   Before restoring, confirm the target database and backup file. A restore
   can replace or add data and should be performed carefully.
*/


/* ============================================================================
   QUESTION 2: BACK UP ALL DATABASES ON THE MYSQL SERVER
   ============================================================================

   COMMAND (run in Command Prompt or PowerShell):

   mysqldump -u root -p --all-databases --routines --triggers --events > all_databases_backup.sql

   EXPLANATION:
   - mysqldump: starts the MySQL export utility.
   - -u root: connects using the root account.
   - -p: prompts for the MySQL password.
   - --all-databases: exports all databases accessible to the account.
   - --routines: includes stored procedures and functions.
   - --triggers: includes triggers.
   - --events: includes scheduled events.
   - > all_databases_backup.sql: saves the server-wide export in this file.

   WHY BACK UP ALL DATABASES BEFORE MIGRATION:
   A server may contain several databases, not just sales. A complete
   server-wide backup helps ensure that other application databases and
   their data are not overlooked during migration. It provides a recovery
   point if the migration fails and helps transfer the server's data.

   RESTORE EXAMPLE (run in the terminal when a restore is required):

   mysql -u root -p < all_databases_backup.sql

   IMPORTANT:
   --all-databases exports all databases available to the MySQL account.
   Review the destination server and backup contents before restoring.
*/


/* ============================================================================
   QUESTION 3: DATA-ONLY BACKUP OF THE SALES DATABASE
   ============================================================================
   NOTE:
   The supplied assignment text did not include the actual Question 3 prompt.
   This solution is based on the assignment learning objective that mentions
   generating data-only database backups. Confirm that this matches the
   instructor's Question 3 before submitting.

   COMMAND (run in Command Prompt or PowerShell):

   mysqldump -u root -p --no-create-info --skip-triggers sales > sales_data_only_backup.sql

   EXPLANATION:
   - -u root: connects using the MySQL root account.
   - -p: prompts for the database password.
   - --no-create-info: omits CREATE TABLE statements, so table definitions
     are not included in this data-only export.
   - --skip-triggers: omits trigger definitions.
   - sales: selects the sales database.
   - > sales_data_only_backup.sql: writes the exported data to this file.

   A data-only backup is useful when the destination already has compatible
   table structures and only the records need to be transferred or restored.
   The target tables must exist with compatible definitions before importing.

   RESTORE EXAMPLE (run in the terminal after confirming the target schema
   and tables already exist):

   mysql -u root -p sales < sales_data_only_backup.sql
*/


/* ============================================================================
   BACKUP BEST PRACTICES
   ============================================================================

   1. Store backups in a secure location separate from the database server.
   2. Protect backup files because they may contain confidential information.
   3. Use clear filenames and dates when keeping multiple backup versions.
   4. Test restores periodically; a backup is useful only if it can be restored.
   5. Confirm that the backup command completed successfully and that the
      expected output file exists and is not empty.
   6. Keep credentials out of command text and scripts. The -p option prompts
      for the password rather than placing it directly in the command.

   SUBMISSION CHECKLIST
   --------------------
   - Save this file with the exact name: answer.sql
   - Include all three question sections in this single file.
   - Test the mysqldump commands in the system terminal, not as SQL queries
     in the MySQL Workbench SQL editor.
   - Commit and push answer.sql to the PLP Week 8 GitHub repository.
   - Follow the instructor's rule on whether backup output files are also
     required; the supplied instructions specifically name answer.sql.

   END OF WEEK 8 ASSIGNMENT
===============================================================================
*/
