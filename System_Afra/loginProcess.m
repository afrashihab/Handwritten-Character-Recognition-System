function actualPassword=loginProcess(username,password)
%DB Service Port, Username, Password
disp('dddjjd');
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
    selectquery='Select Password from teacherdetails';
    curs=exec(dbConn,selectquery);
    curs=fetch(curs);
    actualPassword=curs.Data;
    disp(actualPassword);
    if (strcmp(actualPassword,password))
        disp('Login successful');
        homepage
    else
        disp('Login failed');
    end
    
end
end