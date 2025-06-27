# Use the official Odoo 18.0 image as our base
FROM odoo:18.0

# Switch to the root user to manage files
USER root

# Copy our custom configuration file into the container
COPY ./config/odoo.conf /etc/odoo/odoo.conf

# Copy our custom OpenEduCat 18 modules into the container
COPY ./addons /mnt/extra-addons

# Set the correct ownership for the new files so the 'odoo' user can access them
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo/odoo.conf

# Switch back to the standard, non-priveleged 'odoo' user
USER odoo

# The container will now start Odoo 18 using our config and addons.