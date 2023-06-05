
namespaceStatus=$(kubectl get ns monitoring -o json | jq .status.phase -r)
if [ $namespaceStatus == "Active" ]
then
    echo "namespace is present"

#Deploy cm

kubectl apply -f configmap.yaml

#Deploy DaemonSet

kubectl apply -f logzio.yaml

else
   echo "namespace is not present"
   
kubectl create ns monitoring
#Deploy cm

kubectl apply -f configmap.yaml

#Deploy DaemonSet

kubectl apply -f logzio.yaml
fi
