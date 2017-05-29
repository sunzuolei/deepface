load facenet.mat;
net.layers{end}.type = 'softmax';
root = '测试';
listroot = dir(root);
rightimg = 1;
data = zeros(224,224,3,10,'single');
num = 1;
for i=3:length(listroot)
    listimg = dir(fullfile(root,listroot(i).name));
    n = 1;
    for j=3:length(listimg)
        frame = imread(fullfile(root,listroot(i).name,listimg(j).name));
        im = imresize(frame, [224 224]) ;
        im_ = single(im) ; 
        im_ = bsxfun(@minus,im_,net.meta.normalization.averageImage) ;
        data(:,:,:,n) = im_;
        n = n + 1;
        num =  num + 1;
    end
    res = vl_simplenn(net, data) ;
    scores = squeeze(gather(res(end).x)) ;
    [bestScore, best] = max(scores) ;
    for k=1:10
        if strcmp(net.meta.classes.name{best(k)},listroot(i).name)
            rightimg = rightimg + 1;
        end
    end
    i-2
end
right_acc = (rightimg-1)/(num-1);
