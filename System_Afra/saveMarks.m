function xx=saveMarks(id,name,mark1,mark2,mark3)
host = 'localhost';
hostusername = 'root';
hostpassword = '';
%Database Name
databasename = 'SystemAfra';
 
%JDBC Parameters
jdbcString = sprintf('jdbc:mysql://%s/%s', host, databasename);
jdbcDriver = 'com.mysql.jdbc.Driver';
 

 
%Now making DB connection Object
dbConn = database(databasename, hostusername, hostpassword, jdbcDriver, jdbcString);
 
%checking Connection Status
dbStatus = isopen(dbConn);
if (dbStatus==0)
    msg = sprintf('Failed To Establish Connection.\nReason: %s', dbConn.Message);
    msgbox(msg);
    return
else 
    %selectquery=sprintf('insert into t_result (studentID, name,Dictation1, Dictation2,Dictation3) VALUES (%d,%s,%d,%d,%d)',30);
    %curs=exec(dbConn,selectquery);
    %curs=fetch(curs);
    disp(isnumeric(id));
    fastinsert(dbConn, 'studentmarks',{'studentID', 'name', 'Dictation1', 'Dictation2', 'Dictation3',''},{id,name,mark1,mark2,mark3});
    %actualPassword=curs.Data;
    %disp(actualPassword);
    disp('Saved');
end
end