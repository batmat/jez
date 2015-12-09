// Inspired by https://wiki.jenkins-ci.org/display/JENKINS/Add+a+Maven+Installation%2C+Tool+Installation%2C+Modify+System+Config
import jenkins.model.*

println "Adding an auto installer for Maven 3.3.9"

def mavenPluginExtension = Jenkins.instance.getExtensionList(hudson.tasks.Maven.DescriptorImpl.class)[0]

def asList = (mavenPluginExtension.installations as List)
asList.add(new hudson.tasks.Maven.MavenInstallation('maven-3', null, [new hudson.tools.InstallSourceProperty([new hudson.tasks.Maven.MavenInstaller("3.3.9")])]))

mavenPluginExtension.installations = asList

mavenPluginExtension.save()

println "OK - Maven auto-installer (from Apache) added for 3.3.9"
