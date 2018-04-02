function xx=values(id)
    %DB Service Port, Username, Password
host = 'localhost';
hostusername = 'root';
hostpassword = '';
%Database Name
databasename = 'systemafra';
 disp(id)
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
    selectquery=strcat('Select * from studentmarks where studentID=', int2str(id));
    disp(selectquery);
    curs=exec(dbConn,selectquery);
    curs=fetch(curs);
    disp( curs.Data(1));
    allData=curs.Data;
    disp(allData);
    allData=transpose(allData);
    
    %allData(3)=str2double(allData(3));
    disp(allData(3,:));
    %targets=cell2mat(allData(3:5));
    targets=[str2double(allData(3)),str2double(allData(4)),str2double(allData(5))];
    inputs=[1,2,3];
    %create feedforward neural network
net=feedforwardnet(10);

%train the neural network with the training inputs and targets
net=train(net,inputs,targets);

%view the network
view(net);
    recommendation=net([4]);
%get the predicted output for each day
disp(round(recommendation))
category=round(recommendation);
xx=category;
%check neural network performance
performance=perform(net,recommendation,targets);
    
end