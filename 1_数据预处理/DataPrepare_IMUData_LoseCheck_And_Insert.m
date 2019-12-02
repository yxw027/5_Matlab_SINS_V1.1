function NewData = DataPrepare_IMUData_LoseCheck_And_Insert(mData,Hz)
%对输入的数据按照其自身采样记录时间进行丢包判断，并进行插值处理
% 不能有时间回跳的突变！
DeltaT_ms = fix(1/Hz*1000);
[L,m] = size(mData);

% 1.先判断数据是否丢数  注意：*此处偷懒，仅利用第二列的ms数据进行判断，不考虑 丢包超过1s的情况！！！！*
j = 1;    
mLoseRecord=[0,0];
mLoseTime = 0;
for i=1:L-1
    TempMS = mData(i+1,2)-mData(i,2);  %两个数据的ms差值
    if TempMS < -900  %跨秒情况
        TempMS = TempMS + 1000;
    end
    
    tNumber = round(TempMS/DeltaT_ms)-1;
    if tNumber > 0            
        mLoseRecord(j,1) = i+1;
        mLoseRecord(j,2) = tNumber;
        j = j+1;
        mLoseTime = mLoseTime+1;
        if tNumber > Hz/2
           disp("额滴神，丢数超过半秒了！！！！") 
           return;
        end
    end
end    

% 2. 根据是否丢数，进行新数据的空间声明
if mLoseTime == 0
    %没有丢数 不用差值，直接返回
    NewData = mData;
    return;
else
    %有丢数的，需要进行插值
    L1 = sum(mLoseRecord(:,2));  %需要插值的个数
    NewData = zeros(L+L1,m);
    j = 1;
    mAddNumber = 0;
    for i=1:L        
        if i == mLoseRecord(j,1)
            %第i个数前面需要插值，按照缺的个数插值！ 
            InsertData = Data_Insert_From_Start_End(mData(i-1,:),mData(i,:),mLoseRecord(j,2));
            NewData(i+mAddNumber:i+mAddNumber+mLoseRecord(j,2)-1,:) = InsertData;            
            mAddNumber = mAddNumber+mLoseRecord(j,2);  %记录已经插值的个数
            %插完后，正常赋值                
            NewData(i+mAddNumber,:) = mData(i,:);              
            if j < mLoseTime
                j=j+1;
            end
        else
           % 正常赋值               
           NewData(i+mAddNumber,:) = mData(i,:);
        end             
    end  
end











