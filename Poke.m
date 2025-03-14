% 用1至13分别代替A 2 3 ... J Q K, 重复4次表示四种花色；用14和15分别代表大小王
poke = [repmat(1:13,1,4),14,15];  % 生成一副扑克牌
k = 1;  % 玩到第几把游戏 

while 1
    %% 发牌：从1:54中随机抽取17个数，表示17张牌对应的下标
    % 生成 54 个随机数(54张牌)
    Num = rand(1, 54);
    % 对随机数排序并获取索引
    [~, Indices] = sort(Num);
    idx = Indices(1:17);
    %生成随机排列
    %idx = randperm(54,17);
    p = poke(idx);

    %% 判断是否有炸弹

    % 检查是否有王炸
    Bomb1 = all(ismember([14,15],p));  % true表示有，false表示没有
    % 检查是否有普通的炸弹
    for ii = 1:13
        if sum(p == ii) == 4  % 如果有四张一样的牌
            Bomb2 = true;  %  % 赋值为ture
            break  % 只要有一个普通的炸弹就可以退出for循环了
        else
            Bomb2 = false;
        end
    end

    %% 有一个炸弹即可结束循环
    if Bomb1 || Bomb2  % 如果有王炸或者普通炸弹就可以退出while循环
        break  % 跳出while循环
    else
        k = k + 1;  % 没有炸弹就再玩一把
    end
end

disp(k)  % 输出首次出现炸弹时玩的轮数 
