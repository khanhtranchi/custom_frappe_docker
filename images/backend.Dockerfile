# syntax=docker/dockerfile:1.3

ARG ERPNEXT_VERSION
FROM frappe/erpnext-worker:${ERPNEXT_VERSION}

COPY repos ../apps

USER root

RUN install-app hrms && \
    install-app posawesome && \
    install-app chat && \
    install-app erpnext_telegram_integration && \
    install-app wiki && \
    install-app pdf_on_submit && \
    install-app frappedesk

USER frappe
