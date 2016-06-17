FROM sonarqube:5.6

RUN rm $SONARQUBE_HOME/extensions/plugins/* \

#   && cd $SONARQUBE_HOME/extensions/plugins/ \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-checkstyle-plugin-2.4.jar -fSL https://bintray.com/bintray/jcenter/download_file?file_path=org%2Fcodehaus%2Fsonar%2Fplugins%2Fsonar-checkstyle-plugin%2F2.4%2Fsonar-checkstyle-plugin-2.4.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-findbugs-plugin-3.3.jar -fSL https://bintray.com/bintray/jcenter/download_file?file_path=org%2Fcodehaus%2Fsonar%2Fplugins%2Fsonar-findbugs-plugin%2F3.3%2Fsonar-findbugs-plugin-3.3.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-java-plugin-3.14.jar -fSL https://bintray.com/sonarsource/Distribution/download_file?file_path=sonar-java-plugin%2Fsonar-java-plugin-3.14.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-javascript-plugin-2.13.jar -fSL https://bintray.com/sonarsource/Distribution/download_file?file_path=sonar-javascript-plugin%2Fsonar-javascript-plugin-2.13.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-pmd-plugin-2.5.jar -fSL https://bintray.com/sonarsource/Distribution/download_file?file_path=sonar-pmd-plugin%2Fsonar-pmd-plugin-2.5.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-scm-git-plugin-1.2.jar -fSL https://bintray.com/sonarsource/Distribution/download_file?file_path=sonar-scm-git-plugin%2Fsonar-scm-git-plugin-1.2.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-scm-svn-plugin-1.3.jar -fSL https://bintray.com/sonarsource/SonarQube/download_file?file_path=org%2Fsonarsource%2Fscm%2Fsvn%2Fsonar-scm-svn-plugin%2F1.3%2Fsonar-scm-svn-plugin-1.3.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-web-plugin-2.4.jar -fSL https://bintray.com/sonarsource/Distribution/download_file?file_path=sonar-web-plugin%2Fsonar-web-plugin-2.4.jar \
#   && curl -x fr-proxy.groupinfra.com:3128 -o sonar-widget-lab-plugin-1.8.1.jar -fSL https://bintray.com/sonarsource/SonarQube/download_file?file_path=org%2Fsonarsource%2Fwidget-lab%2Fsonar-widget-lab-plugin%2F1.8.1%2Fsonar-widget-lab-plugin-1.8.1.jar

COPY extensions/plugins/* $SONARQUBE_HOME/extensions/plugins/
