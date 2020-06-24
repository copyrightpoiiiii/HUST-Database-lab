delimiter $$

create procedure insertKeep(in cid int,in Imoney int)
begin
    insert into keepRecord (carID, keepDate, money) VALUES (cid,date_format(now(), '%Y%m%d'),Imoney);
end $$

create procedure makeTable(in startDate date,in endDate date,out carNum int,out keepCar int,out v1 int,out v2 int,out v3 int,out keepFee int,
    out Fee int,out fundSum int,out gain int)
begin
    set @tmp := 0;
    select @tmp := count(*) from carInfo where signDate >= startDate and signDate <= endDate;
    set carNum := @tmp;
    select @tmp := count(*) from carInfo where useState = 1 and (signDate >= startDate and signDate <= endDate);
    set keepCar := @tmp;
    select @tmp := count(*) from userInfo where vipLevel = 0 and (signDate >= startDate and signDate <= endDate);
    set v1 := @tmp;
    select @tmp := count(*) from userInfo where vipLevel = 1 and (signDate >= startDate and signDate <= endDate);
    set v2 := @tmp;
    select @tmp := count(*) from userInfo where vipLevel = 2 and (signDate >= startDate and signDate <= endDate);
    set v3 := @tmp;
    select @tmp := sum(money)
    from keepRecord
    where keepDate >= startDate and keepDate <= endDate;
    set keepFee := @tmp;
    select @tmp := sum(balance)
    from userInfo
    where signDate >= startDate and signDate <= endDate;
    set Fee := @tmp;
    set @tmp2 := 0;
    select @tmp := sum(fixNum),@tmp2 := sum(price)
    from applyRecord
        where receTime >= startDate and receTime <= endDate;
    set fundSum := @tmp;
    set gain := @tmp2;
end $$

create procedure crashServe(in cid int,in type int,in money int)
begin
    set @carid := 0;
    update applyRecord set crashType = type,fixNum = money where cid = id;
    set @id := 0;
    select @id := userID,@carid := carID
    from applyRecord
    where cid = id;
    update userInfo set balance = balance - money where id = @id;
    update carInfo set useState = 4 where id=@carid;
end $$


create procedure userQueryApply(in name char(18))
begin
    select id,carID,brrowTime,receTime,state
    from applyRecord,userAuth
    where userAuth.username = name and userAuth.userID = applyRecord.userID;
end $$

create procedure  bookCar(in carid int,in name char(18),out sta int)
begin
    update carInfo set useState = 2 where id = carid;
    set @userid := 0,@userbalance := 0;
    set @dt = now();
    set @city := null,@pri := 0 ,@preMoney := 0;
    select @city := city,@preMoney := prePrice,@pri := price
    from carInfo
    where id = carid;
    select @userid:=userID,@userbalance := balance
    from userAuth,userInfo
    where username = name and id = userID;
    if(@userbalance >= @pri) then
        insert into applyRecord (userID,brrowTime,ssCity,price,carID,state,crashType,fixNum)
            values (@userid,date_format(@dt, '%Y%m%d'),@city,@pri,carid,1,0,0);
        update userinfo set balance = balance - @preMoney where  id = @userid;
        set sta := 1;
    else set sta := 0;
    end if ;
end $$

create procedure findUser(in name char(20))
begin
    select type
    from userAuth
    where username = name;
end $$

create procedure queryUserInfo(in name char(20))
begin
    select credit,balance,vipLevel
        from userInfo,userAuth
            where userInfo.id = userAuth.userID and userAuth.username = name;
end $$

create procedure logIn(in name char(20),in psd char(20))
begin
    select type
    from userAuth
    where username = name and psd = password;
end $$

create procedure signIn(in uname char(20),in psd char(20),in phoneNum char(22))
begin
    insert into userAuth (username,password,type) values (uname,psd,2);
    insert into userInfo values (-1,phoneNum,60,0,0,date_format(now(), '%Y%m%d'));
    update userInfo,userAuth
    set userInfo.id = userAuth.userID where id = -1 and username = uname;
end $$

create procedure changeBalance(in name char(20),in num int)
begin
    update userInfo,userAuth set userInfo.balance = userInfo.balance + num where userInfo.id = userAuth.userID
                                                                             and userAuth.username = name;
end $$

create procedure queryCarState()
begin
    select id,useTime,useDis,upkeepDate,city,useState
    from carInfo where not (useState = 2 or useState = 3) ;
end $$

delimiter $$
create procedure changeCarState(in carid int,in sta int)
begin
    if(sta = 1)then
        update carInfo set upkeepDate = date_format(now(), '%Y%m%d') where id = carid;
    end if ;
    update carInfo set useState = sta where id = carid;
end $$
delimiter $$

create procedure insertCar(in take int,in cartype int,in carprice int,in cityName char(18))
begin
    insert into carInfo (type,takeNum,price,city,useState,upkeepDate,useTime,useDis)
    values (cartype,take,carprice,cityName,0,curdate(),0,0);
end $$

create procedure queryCar(in take int,in cartype int,in carpriceBegin int,in carpriceEnd int,in cityName char(18))
begin
    select  id,price,type,takeNum,city,useDis,useTime
    from    carInfo
        where takeNum>=take and cartype=type and (price between carpriceBegin and carpriceEnd) and
                city = cityName and useState = 0;
end $$

create procedure deleteCar(in carid int)
begin
    delete from carInfo where id = carid;
end $$

create procedure queryApply()
begin
    select applyRecord.id,username,credit,phone,ssCity,state
    from applyRecord,userInfo,userAuth
    where (state = 3 or state = 1 or state = 4) and applyRecord.userID = userInfo.id and userInfo.id = userAuth.userID;
end $$

create procedure queryUserApply(in name char(20))
begin
    select carID,id,brrowTime,receTime,state
    from applyRecord,userAuth
    where applyRecord.userID = userAuth.userID and userAuth.username=name;
end $$


create procedure submitApply(in inid int,in sta int,in userid int)
begin
    update applyRecord
    set state = sta where inid = id;
    set @carid = 0;
    set @userid = 0;
    set @Money1 = 0 , @Money2 = 0 ,@vip = 0;
    select @Money1 := prePrice , @Money2 := carInfo.price , @vip := vipLevel
    from carInfo,applyRecord,userInfo
    where inid = applyRecord.id and applyRecord.carID = carInfo.id and applyRecord.userID = userInfo.id;
    select @carid := carID,@userid := userID
    from applyRecord
    where inid = id;
    update applyRecord set receTime = date_format(now(), '%Y%m%d'),managerID=userid where id = inid;
    if(sta = 3) then
        update carInfo
            set useState = 3 where id = @carid;
    elseif (sta = 4) then
        update carInfo
        set useState =0 where id = @carid;
        update userInfo
        set balance = balance - ROUND( @Money2 *(1-@vip*0.1)) + @Money1 ,credit =credit+1 where id=@userid;
        update applyRecord set price = ROUND( @Money2 *(1-@vip*0.1)) where id = inid;
        update carInfo set useTime = useTime + 1 ,useDis = useDis + 1000 where id = @carid;
    elseif (sta = 2) then
        update carInfo
        set useState =0 where id = @carid;
    end if ;
end $$


create procedure pentlyApply(in inid int,in crash int,in fix int)
begin
    update applyRecord
    set fixNum = fixNum + fix,crashType = crash where inid = id;
end $$

delimiter ;

create user 'query'@'%' identified by 'query';
grant select on lab2.* to 'query'@'%';

create user 'write'@'%' identified by 'write';
grant select,execute on lab2.* to 'write'@'%';
flush privileges ;
show grants for 'write'@'%';

call queryCar(1,1,0,10000,'武汉');
call userQueryApply('1');
call changeBalance('1',100);
DELIMITER $$
create trigger insertAR after insert
    on applyRecord for each row
    begin
        set @tmp := 0;
        select count(*) into @tmp
            from applyRecord
                group by userID
                    having userID = NEW.userID;
        if (@tmp = 50 or @tmp = 150) then
            update userInfo set vipLevel = vipLevel + 1 where id = NEW.userID;
        end if;
    end $$
DELIMITER ;