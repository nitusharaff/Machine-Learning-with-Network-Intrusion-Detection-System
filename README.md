# Machine-Learning-with-Network-Intrusion-Detection-System

Network Intrusion Detection is the process of recognizing the forthcoming threats or malicious activities in a network in order to avoid critical disruptions in the system.

We identify the nature of threat that may affect the network and try to recognize their possibility through different supervised machine learning algorithms thereby assessing their efficiency. We aim to establish a relationship between the attacks occurring on the network and other network features. Additionally, we put forward a comparative study for a scalable and non-scalable approach to the problem in order to identify the right processing platform for different volume, variety and velocity of data.

<h3> DATASET </h3>
In order to perform analysis on network intrusion detection, we use the KDD Cup 1999 dataset that contains about 41 features and a class label. Each of the label is either named as “normal” or an attack that occurs on the network.

![Alt text](/screenshots/Screenshot1.png)

![Alt text](/screenshots/Screenshot2.png)


<h3> FEATURE SELECTION </h3>
To implement feature selection, we use Extreme Gradient Boosting (XGBoost). XGBoost is an algorithm based on the ensemble model of decision trees used for better performance and speed. We also implement Ci Square, Gain ratio and Information Gain feature selection methods. We use the overlapping top 15 attributes from the given 41 features to train the label thus creating a model.

<h3> CLASSIFICATION USING NON-SCALABLE PLATFORM</h3>
After feature selection, we divide the obtained data to use 70% of the entire dataset for training and the remaining 30% for testing.
 This division is done using random sampling without replacement.
 The training dataset formed is fed to different classifiers for learning the model.
 The model created is used for prediction of test dataset.
 The predicted and observed values are used to calculate accuracy of the model.
 Additionally, time to train and test the model was calculated in order to compare execution time.


<h3> EVALUATION OF CLASSIFICATION USING NON-SCALABLE PLATFORM </h3>
![Alt text](/screenshots/Screenshot3.png)

<h3> APACHE SPARK AS A SCALABLE PLATFORM </h3>
The initial approach towards the modeling of classifiers was performed on a non-scalable platform which did not provide promising performance results in terms of CPU usage, memory consumption and system time. The input data was prepared by taking the top 15 features in the previously mentioned feature selection procedure. The input format for the data in Spark MLlib Naïve Bayes, Decision Tree, and Random Forest has to be in libsvm format. The dataset is then divided into 70% (training) and 30% (testing).

The above mentioned scalable processing on Spark was performed on a single cluster single node having 8 Gigabytes of memory, 121 Gigabytes of disk space and 4 VCPUs.

<h3> EVALUATION OF CLASSIFICATION USING SCALABLE PLATFORM </h3>
![Alt text](/screenshots/Screenshot4.png)

<h3> COMPARISON OF SCALABLE AND NON-SCALABLE PLATFORM </h3>

![Alt text](/screenshots/Screenshot5.png)

![Alt text](/screenshots/Screenshot6.png)

Hence, from the evaluated values and plots we can say that both R and Spark both deliver an acceptable accuracy for each of the classifier, but when it comes to a near real time analysis, execution time plays a major role. Spark provides a better system time while training and testing the data as compared to the non-scalable platform. It would be advantageous to use Spark to detect anomalies in the network on a near real time basis and also with heavily streaming data.


<h3> FILES </h3>
preprocess.R- preprocessing the data </br>
chisq.R - calculating chi square feature extraction</br>
gainratio.R - calculating gain ratio feature extraction</br>
xgboost.R -calculating xgboost feature extraction</br>
decisiontrees.R- running model for decision trees</br>
naiveBayes.R- running model for Naive Bayes</br>
svm.R - running model for SVM</br>
randomForest.R- running model for Random Forest</br>
parallelsvm- running model for parallel svm</br>
plot.R - creating plots</br>
