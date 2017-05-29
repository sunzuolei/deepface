# deepface
Face recognition with deep learning.
===================

Structure
-------------

 - Code
	 - data pre-preparation and test code
     - right_acc code
 - Model
	 - MatConvnet  

Description
-------------
Data Pre-processing

 1. Download "Matconvnet" and config it with VS conpiler.
 2. Download face dataset such as  imdb.mat.

Training
 Run "facerecognize.m"
 Click "训练"
 1. The imdb.mat and images in "人脸库" are trained by CNN framework.The images in "人脸库" should be full of faces.
 2. The results are saved in facenet.mat . 

Test
 Click "开始".Then "载入".Choose images in "测试" and click "识别".
 1. Test images in "测试" to recognize faces.
 2. You will get the recognition result in "身份" and recognition time in "耗时".

Right_Acc
Run "test.m"
 1. Test all face images in "测试" to get accuracy.


  

