# FROM daggerok/jboss-eap-7.2:7.2.71-alpine
FROM luchoepn/jboss-eap-7.2:latest
# environment variable for local location
ENV LOCAL_SCRIPTS scripts

# environment variables for installables
ENV BASE_TMP_INSTALL /tmp
ENV BASE_TMP_PACKAGE_INSTALL $BASE_TMP_INSTALL/packages

# environment variables for atg location
ENV BASE_DIR /appl
ENV SCRIPT_DIR /appl

#######################################
# create directories for copying initial copy of packages
RUN mkdir -p $BASE_TMP_PACKAGE_INSTALL

# directory for final install of application created as part of script directory
RUN sudo mkdir -p $SCRIPT_DIR
RUN sudo chmod -R 755 $SCRIPT_DIR

#######################################
# copy ATG
ADD OCPlatform11.3.2_21REL.bin $BASE_TMP_PACKAGE_INSTALL/OCPlatform11.3.2_21REL.bin

# unzip oracle zip file for ATG to OCPlatform11.3.bin
#RUN unzip $BASE_TMP_PACKAGE_INSTALL/V861209-01.zip -d $BASE_TMP_INSTALL

# make OCPlatform11.3.bin executable for install
RUN sudo chmod +x $BASE_TMP_PACKAGE_INSTALL/OCPlatform11.3.2_21REL.bin

#######################################
# copy jdbc driver to jboss location
ADD ojdbc7.jar /appl/jboss-eap-5.1.2/jboss-as/lib/ojdbc7.jar

#######################################
# DONE

ENV AUTHORIZED_KEYS **None**

EXPOSE 22
#CMD ["/run.sh"]
