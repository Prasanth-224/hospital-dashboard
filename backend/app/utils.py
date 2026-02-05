def los_risk_flag(avg_los):
    if avg_los > 10:
        return "High LOS Risk"
    elif avg_los > 6:
        return "Moderate Risk"
    return "Normal"
