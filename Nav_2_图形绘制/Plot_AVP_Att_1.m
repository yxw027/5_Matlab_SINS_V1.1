function Plot_AVP_Att_1(AVP0,num)
% 绘制输入的姿态信息
% 如果输入两组数据，第一组为参照数据，采用红色
% 输入参数的格式为(按列)  
%       时间(单位ms) 姿态(俯仰、横滚、航向，单位弧度) 速度 位置(纬度、经度，单位弧度，高程 单位米)
%



%% 绘制姿态信息    
%     figure;
%     set(gcf,'position',[250,250,1200,480]);
%     subplot(1,3,1);
%     plot(AVP0(:,1),AVP0(:,2).*(180/pi),'r');
%     hold on;
%     plot(State(:,1),(State(:,2).*10+AVP0(1,2).*(180/pi)));    
%     xlabel('\it t \rm / s');
%     ylabel('\it \theta \rm / \circ');
%     title('姿态-俯仰');
%     
%     subplot(1,3,2);
%     plot(AVP0(:,1),AVP0(:,3).*(180/pi),'r');
%     hold on;
%     plot(State(:,1),(State(:,2).*10+AVP0(1,3).*(180/pi))); 
%     xlabel('\it t \rm / s');
%     ylabel('\it \gamma \rm / \circ');
%     title('姿态-横滚');
%     
%     subplot(1,3,3);
%     plot(AVP0(:,1),AVP0(:,4).*(180/pi),'r');
%     hold on;
%     plot(State(:,1),(State(:,2).*10+AVP0(1,4).*(180/pi))); 
%     xlabel('\it t \rm / s');
%     ylabel('\it \psi \rm / \circ');
%     title('姿态-航向');
    
    figure;
    set(gcf,'position',[250,250,1200,480]);
    subplot(1,3,1);
    plot(1:num,AVP0(1:num,2).*(180/pi));
    xlabel('n');
    ylabel('\it \theta \rm / \circ');
    title('x轴角增量');
    
    subplot(1,3,2);
    plot(1:num,AVP0(1:num,3).*(180/pi));
    xlabel('n');
    ylabel('\it \gamma \rm / \circ');
    title('y轴角增量');
    
    subplot(1,3,3);
    plot(1:num,AVP0(1:num,4).*(180/pi));
    xlabel('n');
    ylabel('\it \psi \rm / \circ');
    title('z轴角增量');


