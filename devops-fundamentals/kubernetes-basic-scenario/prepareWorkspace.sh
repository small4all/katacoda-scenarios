
read -p "Bitte gebe deinen User Token ein: " USER_TOKEN
echo "Dein User Token lautet:" $USER_TOKEN

read -p "Bitte gebe deinen Namespace ein: " NAMESPACE
echo "Dein Namespace lautet:" $NAMESPACE

echo "Konfiguriere kubeconfig..."

kubectl config set-cluster k8s --server="${SERVER}"
kubectl config set clusters.k8s.certificate-authority-data ${CERTIFICATE_AUTHORITY_DATA}
kubectl config set-credentials ${USER} --token="${USER_TOKEN}"
kubectl config set-context ${USER} --cluster=k8s --user=${USER} --namespace=${NAMESPACE}
kubectl config use-context ${USER}

echo "Teste kubeconfig..."
kubectl version 