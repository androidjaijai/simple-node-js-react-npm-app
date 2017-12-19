git diff --stat $GIT_COMMIT $GIT_PREVIOUS_COMMIT;
echo $?;
if [ $? == 0 ]; then
  echo "success"
else
  echo "failed"
fi
