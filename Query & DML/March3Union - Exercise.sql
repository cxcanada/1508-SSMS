select studentid 'ID', 'Student Born:' + firstname + ' ' + lastname 'Event:Name' from student
where datename(mm, Birthdate) = 'october'

union all

select staffid, 'Staff Hired:' + firstname + ' ' + lastname from staff
where datename(mm, DateHired) = 'october'

order by studentid desc

select * from staff
