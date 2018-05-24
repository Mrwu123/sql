IF(OBJECT_ID('Student_Time') is not null)        -- 判断名为 Student_Count 的触发器是否存在

DROP TRIGGER Student_Time        -- 删除触发器

GO
CREATE TRIGGER Student_Time

ON student  	         

AFTER

INSERT

AS 

	declare @UserName    nchar(10)

	declare @DateTime    datetime

	declare @studentname nchar(10)



	select @UserName = system_user

	select @DateTime = CONVERT(datetime,GETDATE(),120)
	
	select @studentname= sname from inserted

	INSERT INTO time(UserName,datetime,studentname)

	VALUES (@UserName,@DateTime,@studentname)
